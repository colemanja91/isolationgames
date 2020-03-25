# frozen_string_literal: true

class UserCard < ApplicationRecord
  include AASM
  belongs_to :user_game
  belongs_to :white_card
  belongs_to :user_round, optional: true

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
      transitions from: :available, to: :played, after: :play_card!
    end
  end
end
