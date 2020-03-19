class Types::UserGameType < Types::BaseObject
  field :id, Integer, null: false
  field :user_display_name, String, null: false
  field :status, Types::UserGameStatusEnum, null: false

  def user_game
    @object
  end

  def user_display_name
    user_game.user.display_name
  end
end
