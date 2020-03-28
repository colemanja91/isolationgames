# frozen_string_literal: true

class Mutations::PickWinner < Types::BaseMutation
  null false

  description 'Pick winning for the current round of a game'

  argument :user_round_id, Integer, required: true

  def resolve(user_round_id:)
    current_user = context[:current_user]
    game = current_user.current_game.game

    unless game.current_round.user == current_user
      raise GraphQL::ExecutionError, 'Only the round judge can pick a winner.'
    end

    game.current_round.user_rounds.find(user_round_id).update!(winner: true)
    game
  end
end
