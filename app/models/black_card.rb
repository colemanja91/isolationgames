# frozen_string_literal: true

class BlackCard < ApplicationRecord
  belongs_to :card_set
  has_many :game_rounds
end
