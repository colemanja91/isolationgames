# frozen_string_literal: true

class GameRound < ApplicationRecord
  belongs_to :game
  has_one :black_card
  has_many :user_cards
end
