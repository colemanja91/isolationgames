class Mutations::NewGame < Types::BaseMutation
  null false

  description "Start a new game"

  argument :phone_number, String, required: true

  def resolve(phone_number:)
    user = User.find_or_create_by(phone_number: phone_number)
    game = user.games.create!
    user.join_game!(game)

    game
  end
end
