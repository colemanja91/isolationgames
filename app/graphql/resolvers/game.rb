# frozen_string_literal: true

class Resolvers::Game < Resolvers::Base
  description 'Return the specified game'

  argument :id, Integer, required: true

  def resolve(id:)
    current_user = context[:current_user]
    current_user.joined_games.active.find(id)
  rescue ActiveRecord::RecordNotFound
    raise GraphQL::ExecutionError, 'Game not found.'
  end
end
