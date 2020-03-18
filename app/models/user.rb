# frozen_string_literal: true

class User < ApplicationRecord
  has_many :user_games
  has_many :games

  validates :phone_number, presence: true, uniqueness: true

  def joined_games
    user_games.joined
  end

  def live_games
    games.where(status: [:created, :started])
  end

  def join_game!(game)
    user_games.create!(game: game)
  end
end
