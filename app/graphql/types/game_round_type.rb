class Types::GameRoundType < Types::BaseObject
  field :id, Integer, null: false
  field :black_card, Types::BlackCardType, null: false
  field :played_cards, [Types::UserCardType], null: false
  field :round, Integer, null: false
  field :status, Types::GameRoundStatusEnum, null: false
  field :user, Types::UserType, null: false
  field :winner, Types::UserCardType, null: true

  def game_round
    @object
  end

  def played_cards
    if game_round.submitted?
      return game_round.user_cards
    end

    []
  end
end
