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

  scope :active, -> { where(status: %i[created started]) }

  MIN_PLAYERS = 4
  MAX_PLAYERS = 10

  enum status: {
    created: 0,
    started: 10,
    ended: 20
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    state :created, initial: true
    state :started
    state :ended

    event :start do
      transitions from: :created, to: :started, guard: :minimum_players?, after: :start_round!
    end

    event :end do
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

    if user_games.joined.count < MIN_PLAYERS
      self.end!
    end
  end

  def end_user_games!
    user_games.joined.each(&:leave!)
  end

  private

  def set_name
    self.name = Haikunator.haikunate(0)
  end

  def minimum_players?
    user_games.count >= MIN_PLAYERS
  end
end
