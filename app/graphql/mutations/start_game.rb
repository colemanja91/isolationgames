class Mutations::StartGame < Types::BaseMutation
  null false

  description "Start an existing game"

  def resolve
    current_user = context[:current_user]
    game = current_user.current_game.game
    game.start!
    game.reload
    game
  end
end
