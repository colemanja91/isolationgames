# frozen_string_literal: true

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_games
  has_many :joined_games, through: :user_games, class_name: 'Game', source: :game
  has_many :games

  validates :email, presence: true, uniqueness: true
  validates :uid, presence: true

  def self.from_google(email:, uid:, avatar_url:)
    create_with(uid: uid, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def self.local_account
    find_or_create_by!(
      email: 'webmaster@isolation.games'
    )
  end

  def current_game
    user_games.joined.first
  end

  def display_name
    name.presence || email
  end

  def join_game!(game)
    existing_game = user_games.find_by(game: game) || user_games.create!(game: game)
    existing_game.join! if existing_game.left?
    existing_game
  end
end
