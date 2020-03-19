class Types::BlackCardType < Types::BaseObject
  field :id, Integer, null: false
  field :text, String, null: false
  field :pick, Integer, null: false

  def black_card
    @object
  end
end
