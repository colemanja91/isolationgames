# frozen_string_literal: true

class Types::GameType < Types::BaseObject
  field :id, Integer, null: false
  field :enough_players, Boolean, null: false
  field :is_owner, Boolean, null: false
  field :current_round, Types::GameRoundType, null: true
  field :game_owner, Types::UserType, null: false
  field :hand, [Types::UserCardType], null: true
  field :name, String, null: false
  field :players, [Types::UserGameType], null: false
  field :started_at, Types::DateTimeType, null: true
  field :status, Types::GameStatusEnum, null: false
  field :video_link, String, null: true

  def game
    @object
  end

  def current_user
    @context[:current_user]
  end

  def is_owner
    current_user == game_owner
  end

  def game_owner
    game.user
  end

  def players
    game.user_games
  end

  def hand
    current_user.current_game.hand.order(id: :desc)
  end
end
