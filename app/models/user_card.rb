# frozen_string_literal: true

class UserCard < ApplicationRecord
  belongs_to :user_game
  belongs_to :white_card
  has_one :game_round
end
