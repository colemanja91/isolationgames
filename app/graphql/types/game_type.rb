class Types::GameType < Types::BaseObject
  field :id, String, null: false
  field :name, String, null: false
  field :started_by_display_name, String, null: true
end
