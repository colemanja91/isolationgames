# frozen_string_literal: true

class Mutations::PlayCards < Types::BaseMutation
  null false

  description 'Play cards for the current round of a game'

  argument :user_card_ids, [Integer], required: true

  def resolve(user_card_ids:)
    current_user = context[:current_user]
    user_game = current_user.current_game

    if user_card_ids.count != user_game.game.current_round.black_card.pick
      raise GraphQL::ExecutionError, "Must play #{user_game.game.current_round.black_card.pick} card(s)."
    end

    user_game.play_cards(user_card_ids)
    user_game.game
  end
end
