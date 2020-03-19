class Resolvers::Game < Resolvers::Base
  description "Return the specified game"

  argument :game_name, String, required: true

  def resolve(game_name:)
    current_user = context[:current_user]
    current_user.joined_games.active.find_by(name: game_name)
  end
end
