class Types::UserType < Types::BaseObject
  field :id, String, null: false
  field :name, String, null: true
  field :live_games, [Types::GameType], null: true
  field :joined_games, [Types::UserGameType], null: true

  def user
    @object
  end
end
