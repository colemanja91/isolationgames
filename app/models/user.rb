# frozen_string_literal: true

class User < ApplicationRecord
  has_many :cognito_sessions
  has_many :user_games
  has_many :games

  validates :subscriber, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.local_account
    find_or_create_by!(
      email: "webmaster@isolation.games",
      subscriber: "local"
    )
  end

  def joined_games
    user_games.joined
  end

  def live_games
    games.where(status: [:created, :started])
  end

  def join_game!(game)
    existing_game = user_games.find_by(game: game) || user_games.create!(game: game)
    existing_game.join! if existing_game.left?
    existing_game
  end
end
