class Types::GameRoundType < Types::BaseObject
  field :id, Integer, null: false
  field :black_card, Types::BlackCardType, null: false
  field :round, Integer, null: false
  field :status, Types::GameRoundStatusEnum, null: false
  field :user, Types::UserType, null: false

  def game_round
    @object
  end
end
