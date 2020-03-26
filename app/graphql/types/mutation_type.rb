module Types
  class MutationType < GraphQL::Schema::Object
    field :add_video_link, Types::GameType, mutation: Mutations::AddVideoLink
    field :end_game, Types::GameType, mutation: Mutations::EndGame
    field :join_game, Types::GameType, mutation: Mutations::JoinGame
    field :leave_game, Types::UserGameType, mutation: Mutations::LeaveGame
    field :new_game, Types::GameType, mutation: Mutations::NewGame
    field :new_round, Types::GameType, mutation: Mutations::NewRound
    field :play_cards, Types::GameType, mutation: Mutations::PlayCards
    field :pick_winner, Types::GameType, mutation: Mutations::PickWinner
    field :start_game, Types::GameType, mutation: Mutations::StartGame
    field :update_user_name, Types::UserType, mutation: Mutations::UpdateUserName
  end
end
