# frozen_string_literal: true

class UserCard < ApplicationRecord
  belongs_to :user_game
  belongs_to :white_card
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
      transitions from: :available, to: :played
    end
  end
end
