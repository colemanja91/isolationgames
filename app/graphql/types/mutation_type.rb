module Types
  class MutationType < GraphQL::Schema::Object
    field :join_game, Types::GameType, mutation: Mutations::JoinGame
    field :new_game, Types::GameType, mutation: Mutations::NewGame
  end
end
