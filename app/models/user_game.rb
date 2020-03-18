# frozen_string_literal: true

class UserGame < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :game
  has_many :user_cards

  enum status: {
    joined: 0,
    left: 10
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    state :joined, initial: true
    state :left

    event :join do
      transitions from: :left, to: :joined
    end

    event :leave do
      transitions from: :joined, to: :left
    end
  end
end
