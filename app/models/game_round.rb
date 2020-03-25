# frozen_string_literal: true

class GameRound < ApplicationRecord
  include AASM
  belongs_to :game
  belongs_to :black_card
  belongs_to :user
  has_many :user_rounds

  before_validation :setup, on: :create

  validates :user, presence: true
  validates :game, presence: true
  validates :black_card, presence: true
  validates :round, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :only_one_in_progress_round, on: :create

  after_commit :draw_cards, on: :create

  scope :in_progress, -> { where(status: %i[started submitted]) }

  enum status: {
    started: 0,
    submitted: 10,
    ended: 20
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    state :started, initial: true
    state :submitted
    state :ended

    event :submit do
      transitions from: :started, to: :submitted
    end

    event :end do
      transitions from: :submitted, to: :ended
    end
  end

  def check_status!
    submit! if user_rounds.count == game.user_games.joined.count
  end

  def winner
    user_rounds.winner&.first
  end

  private

  def setup
    set_round
    set_user
    set_black_card
  end

  # pick a random black card which
  # has not yet been played in this game
  def set_black_card
    black_deck = BlackCard.where.not(id: game.game_rounds.pluck(:id))
    offset = rand(black_deck.count)
    self.black_card = black_deck.offset(offset).first
  end

  def set_round
    self.round = (game.game_rounds.last&.round || 0) + 1
  end

  # This felt really weird, now it feels better
  # but is kind of obscure.
  # This should start with the first user to join,
  # work forward by join order,
  # then start again at the beginning
  def set_user
    user_games = game.user_games.order(id: :asc)

    self.user = user_games[(round % user_games.count) - 1].user
  end

  def draw_cards
    game.user_games.each(&:draw_cards)
  end

  def only_one_in_progress_round
    return true unless game.game_rounds.in_progress.present?

    errors.add(:game, "round is still in progress!")
  end
end
