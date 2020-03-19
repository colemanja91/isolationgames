class Mutations::StartGame < Types::BaseMutation
  null false

  description "Start an existing game"

  argument :game_id, Integer, required: true

  def resolve(game_id:)
    current_user = context[:current_user]
    game = current_user.games.find(game_id)
    game.start!
    game.reload
    game
  end
end
