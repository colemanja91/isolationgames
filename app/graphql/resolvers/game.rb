# frozen_string_literal: true

class Resolvers::Game < Resolvers::Base
  description 'Return the specified game'

  def resolve
    current_user = context[:current_user]
    game = current_user.current_game&.game

    return nil unless game

    game
  end
end
