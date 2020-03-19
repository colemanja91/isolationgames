class Types::UserType < Types::BaseObject
  field :id, String, null: false
  field :display_name, String, null: true

  def user
    @object
  end
end
