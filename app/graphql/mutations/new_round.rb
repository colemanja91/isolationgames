# frozen_string_literal: true

class Mutations::NewRound < Types::BaseMutation
  null false

  description 'Start a new round'

  def resolve
    current_user = context[:current_user]
    game = current_user.current_game.game

    if game.current_round.started? || game.current_round.winner.nil?
      raise GraphQL::ExecutionError, 'Current round still in progress.'
    end

    game.current_round.end!
    game.start_round!
    game
  end
end
