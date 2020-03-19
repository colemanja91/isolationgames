class Types::GameType < Types::BaseObject
  field :id, String, null: false
  field :game_owner, Types::UserType, null: false
  field :name, String, null: false
  field :players, [Types::UserGameType], null: false
  field :started_at, Types::DateTimeType, null: true
  field :status, Types::GameStatusEnum, null: false
  field :video_link, String, null: true

  def game
    @object
  end

  def game_owner
    game.user
  end

  def players
    game.user_games
  end
end
