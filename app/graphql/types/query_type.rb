module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: false, resolver: Resolvers::User
  end
end
