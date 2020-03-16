# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :game_card_sets
  has_many :user_games
  has_many :game_rounds
  belongs_to :user

  MIN_PLAYERS = 4
  MAX_PLAYERS = 8

  enum status: {
    created: 0,
    started: 10,
    ended: 20
  }

  aasm column: :state, enum: true, whiny_persistance: true do
    after_all_transitions :on_all_transitions

    state :created, initial: true
    state :started
    state :ended

    event :start do
      transitions from: :created, to: :started
    end

    event :end do
      transitions from: :started, to: :ended
    end
  end

  def add_user(user)
    if user_games.joined.count >= MAX_PLAYERS
      # Tell them the game is full :(
    end

    user_games.create!(user: user)
  end
end
