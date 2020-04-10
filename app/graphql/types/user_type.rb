# frozen_string_literal: true

class Types::UserType < Types::BaseObject
  field :id, Integer, null: false
  field :display_name, String, null: false
  field :email, String, null: false
  field :name, String, null: true
  field :avatar_url, String, null: true

  def user
    @object
  end
end
