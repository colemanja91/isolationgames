# frozen_string_literal: true

class GameRound < ApplicationRecord
  include AASM
  belongs_to :game
  belongs_to :black_card
  belongs_to :user
  has_many :user_cards

  before_validation :set_black_card, on: :create
  before_validation :set_round, on: :create
  before_validation :set_user, on: :create

  validates :user, presence: true
  validates :game, presence: true
  validates :black_card, presence: true
  validates :round, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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
      transitions from: :started, to: :ended
    end
  end

  private

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

  # This feels really weird
  def set_user
    user_games = game.user_games.order(user_id: :desc)
    last_user = game.game_rounds.last&.user

    unless last_user
      self.user = user_games.first.user
      return
    end

    self.user = user_games[user_games.index(user: last_user) - 1].user
  end

  def draw_cards
    game.user_games.each(&:draw_cards)
  end
end
