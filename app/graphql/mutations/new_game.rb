class Mutations::NewGame < Types::BaseMutation
  null false

  description "Start a new game"

  def resolve()
    current_user = context[:current_user]
    game = current_user.games.create!
    current_user.join_game!(game)

    game
  end
end
