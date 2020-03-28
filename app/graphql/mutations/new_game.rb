# frozen_string_literal: true

class Mutations::NewGame < Types::BaseMutation
  null false

  description 'Start a new game'

  def resolve
    current_user = context[:current_user]

    if current_user.games.active.present? || current_user.user_games.joined.present?
      raise GraphQL::ExecutionError, 'User has already joined a game.'
    end

    game = current_user.games.create!
    current_user.join_game!(game)

    game
  end
end
