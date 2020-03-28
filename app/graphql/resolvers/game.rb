class Resolvers::Game < Resolvers::Base
  description "Return the specified game"

  argument :id, Integer, required: true

  def resolve(id:)
    current_user = context[:current_user]
    current_user.joined_games.active.find(id)
  end
end
