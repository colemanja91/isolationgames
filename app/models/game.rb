# frozen_string_literal: true

class Game < ApplicationRecord
  include AASM
  has_many :game_card_sets
  has_many :user_games
  has_many :game_rounds
  belongs_to :user

  before_validation :set_name, on: :create

  validates :user, presence: true
  validates :name, presence: true, uniqueness: true
  validate :only_one_active_per_user, on: :create

  scope :active, -> { where(status: %i[created started]) }

  MIN_PLAYERS = 4
  MAX_PLAYERS = 10

  enum status: {
    created: 0,
    started: 10,
    ended: 20
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    after_all_transitions :track_transition
    state :created, initial: true
    state :started
    state :ended

    event :start do
      transitions from: :created, to: :started, guard: :enough_players, after: :start_round!
    end

    event :end do
      transitions from: :created, to: :ended, after: :end_user_games!
      transitions from: :started, to: :ended, after: :end_user_games!
    end
  end

  def current_round
    game_rounds.in_progress.last
  end

  def start_round!
    game_rounds.create!
  end

  def check_status!
    return unless started?

    end! if user_games.joined.count < MIN_PLAYERS || owner_gone?
  end

  def owner_gone?
    user_games.left.where(user_id: user_id).any?
  end

  def end_user_games!
    user_games.joined.each(&:leave!)
  end

  def enough_players
    user_games.joined.count >= MIN_PLAYERS
  end

  private

  def set_name
    self.name = Haikunator.haikunate
  end

  def only_one_active_per_user
    user.current_game.nil?
  end

  def track_transition
    timestamp_setter = "#{aasm.to_state}_at="
    public_send(timestamp_setter, Time.current) if respond_to?(timestamp_setter)
  end
end
