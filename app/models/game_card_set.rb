# frozen_string_literal: true

class GameCardSet < ApplicationRecord
  belongs_to :game
  has_many :card_sets
end
