# frozen_string_literal: true

class Types::UserGameType < Types::BaseObject
  field :id, Integer, null: false
  field :is_judge, Boolean, null: false
  field :is_owner, Boolean, null: false
  field :user_display_name, String, null: false
  field :status, Types::UserGameStatusEnum, null: false

  def user_game
    @object
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
