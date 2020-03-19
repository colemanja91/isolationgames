module Types
  class MutationType < GraphQL::Schema::Object
    field :add_video_link, Types::GameType, mutation: Mutations::AddVideoLink
    field :join_game, Types::GameType, mutation: Mutations::JoinGame
    field :new_game, Types::GameType, mutation: Mutations::NewGame
  end
end
