# frozen_string_literal: true

class UserCard < ApplicationRecord
  belongs_to :user_game
  belongs_to :white_card
  belongs_to :game_round_won, class_name: 'GameRound'
  has_one :game_round

  validates :user_game, presence: true
  validates :white_card, presence: true

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
end
