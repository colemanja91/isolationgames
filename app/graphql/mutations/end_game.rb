# frozen_string_literal: true

class Mutations::EndGame < Types::BaseMutation
  null false

  description 'End game'

  def resolve
    current_user = context[:current_user]
    game = current_user.games.active.first
    raise GraphQL::ExecutionError, 'User does not own this game.' unless game

    game.end!
    game
  end
end
