module Types
  class QueryType < Types::BaseObject
    field :game, Types::GameType, null: false, resolver: Resolvers::Game
    field :user, Types::UserType, null: false, resolver: Resolvers::User
  end
end
