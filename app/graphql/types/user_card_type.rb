class Types::UserCardType < Types::BaseObject
  field :id, Integer, null: false
  field :text, String, null: false

  def user_card
    @object
  end

  def text
    user_card.white_card.text
  end
end
