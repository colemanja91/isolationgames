# frozen_string_literal: true

class UserRound < ApplicationRecord
  has_many :user_cards
  belongs_to :game_round
  belongs_to :user_game

  validates :game_round, presence: true
  validates :user_game, presence: true

  scope :winner, -> { where(winner: true) }
end
