class Mutations::LeaveGame < Types::BaseMutation
  null false

  description "Leave a game"

  argument :game_id, Integer, required: true

  def resolve(game_id:)
    current_user = context[:current_user]
    user_game = current_user.user_games.find_by(game_id: game_id)
    unless user_game
      raise GraphQL::ExecutionError.new("Not currently joined to this game.")
    end

    user_game.leave!
    user_game.game.check_status!
    user_game
  end
end
