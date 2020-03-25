class Types::UserRoundType < Types::BaseObject
  field :id, Integer, null: false
  field :user, Types::UserType, null: false
  field :user_cards, [Types::UserCardType], null: false
  field :winner, Boolean, null: false

  def user_round
    @object
  end

  def user
    user_round.user_game.user
  end
end
