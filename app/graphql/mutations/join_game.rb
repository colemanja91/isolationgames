# frozen_string_literal: true

class Mutations::JoinGame < Types::BaseMutation
  null false

  description 'Join a user to an existing game'

  argument :game_name, String, required: true

  def resolve(game_name:)
    current_user = context[:current_user]

    if current_user.games.active.present? || current_user.user_games.joined.present?
      raise GraphQL::ExecutionError, 'User has already joined a game.'
    end

    game = Game.active.find_by(name: game_name)
    raise GraphQL::ExecutionError, 'Game not found' unless game

    current_user.join_game!(game)
    game
  end
end
