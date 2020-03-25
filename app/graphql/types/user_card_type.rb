class Types::UserCardType < Types::BaseObject
  field :id, Integer, null: false
  field :text, String, null: false
  field :user, Types::UserType, null: false

  def user_card
    @object
  end

  def text
    user_card.white_card.text
  end

  def user
    user_card.user_game.user
  end
end
