class Mutations::JoinGame < Types::BaseMutation
  null false

  description "Join a user to an existing game"

  argument :game_name, String, required: true

  def resolve(game_name:)
    current_user = context[:current_user]
    game = Game.active.find_by(name: game_name)
    unless game
      raise GraphQL::ExecutionError.new("Game does not exist.")
    end

    current_user.join_game!(game)
    game
  end
end
