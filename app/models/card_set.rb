# frozen_string_literal: true

class CardSet < ApplicationRecord
  has_many :white_cards
  has_many :black_cards
  has_many :game_card_sets
end
