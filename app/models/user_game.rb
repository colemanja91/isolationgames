# frozen_string_literal: true

class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :user_cards
end
