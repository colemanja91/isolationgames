module Types
  class MutationType < GraphQL::Schema::Object
    field :new_game, Types::GameType, mutation: Mutations::NewGame
  end
end
