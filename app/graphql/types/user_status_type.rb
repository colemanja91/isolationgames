class Types::UserStatusType < Types::BaseObject
  field :username, String, null: false
  field :status, String, null: false
end
