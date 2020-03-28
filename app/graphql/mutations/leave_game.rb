# frozen_string_literal: true

class Mutations::LeaveGame < Types::BaseMutation
  null false

  description 'Leave a game'

  def resolve
    current_user = context[:current_user]
    user_game = current_user.current_game
    unless user_game
      raise GraphQL::ExecutionError, 'Not currently joined to this game.'
    end

    user_game.leave!
    user_game.game.check_status!
    user_game
  end
end
