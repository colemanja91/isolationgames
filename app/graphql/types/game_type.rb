class Types::GameType < Types::BaseObject
  field :id, Integer, null: false
  field :current_round, Types::GameRoundType, null: true
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
