# frozen_string_literal: true

class UserCard < ApplicationRecord
  include AASM
  belongs_to :user_game
  belongs_to :white_card
  has_one :game_round

  validates :user_game, presence: true
  validates :white_card, presence: true
  validate :only_one_winner_per_round

  scope :winner, -> { where(winner: true) }

  enum status: {
    available: 0,
    played: 10
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    state :available, initial: true
    state :played

    event :play do
      transitions from: :available, to: :played, before: :play_card!
    end
  end

  def play_card!
    update!(game_round: user_game.game.current_round)
    game_round.check_status!
  end

  private

  def only_one_winner_per_round
    return unless winner

    if self.class.where("id <> ? AND game_round_id = ? AND winner = true", id, game_round_id).exists?
      errors.add(:winner, "must only be true for one card per round")
    end
  end
end
