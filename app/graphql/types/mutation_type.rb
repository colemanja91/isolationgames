module Types
  class MutationType < GraphQL::Schema::Object
    field :add_video_link, Types::GameType, mutation: Mutations::AddVideoLink
    field :join_game, Types::GameType, mutation: Mutations::JoinGame
    field :new_game, Types::GameType, mutation: Mutations::NewGame
    field :pick_winner, Types::GameType, mutation: Mutations::PickWinner
    field :start_game, Types::GameType, mutation: Mutations::StartGame
    field :update_user_name, Types::UserType, mutation: Mutations::UpdateUserName
  end
end
