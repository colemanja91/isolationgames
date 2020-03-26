class Mutations::NewRound < Types::BaseMutation
  null false

  description "Start a new round"

  argument :game_id, Integer, required: true

  def resolve(game_id:)
    current_user = context[:current_user]
    game = current_user.games.find(game_id)
    game.current_round.end!
    game.start_round!
    game
  end
end
