# frozen_string_literal: true

class Types::UserGameType < Types::BaseObject
  field :id, Integer, null: false
  field :has_played, Boolean, null: false
  field :is_judge, Boolean, null: false
  field :is_owner, Boolean, null: false
  field :user_display_name, String, null: false
  field :status, Types::UserGameStatusEnum, null: false
  field :won_rounds, Integer, null: false

  def user_game
    @object
  end

  def has_played
    user_game.user_rounds.where(game_round: user_game.game.current_round).any?
  end

  def is_judge
    user_game.user == user_game.game.current_round&.user
  end

  def is_owner
    user_game.game.user == user_game.user
  end

  def user_display_name
    user_game.user.display_name
  end
end
