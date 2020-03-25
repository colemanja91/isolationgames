class Types::GameRoundType < Types::BaseObject
  field :id, Integer, null: false
  field :black_card, Types::BlackCardType, null: false
  field :user_rounds, [Types::UserRoundType], null: false
  field :round, Integer, null: false
  field :status, Types::GameRoundStatusEnum, null: false
  field :user, Types::UserType, null: false
  field :winner, Types::UserRoundType, null: true

  def game_round
    @object
  end

  def user_rounds
    if game_round.submitted?
      return game_round.user_rounds
    end

    []
  end
end
