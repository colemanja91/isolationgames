class Mutations::EndGame < Types::BaseMutation
  null false

  description "End game"

  argument :game_id, Integer, required: true

  def resolve(game_id:)
    current_user = context[:current_user]
    game = current_user.games.find(game_id)
    unless game
      raise GraphQL::ExecutionError.new("User does not own this game.")
    end

    game.end!
    game
  end
end
