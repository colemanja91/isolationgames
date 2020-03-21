class Mutations::PlayCards < Types::BaseMutation
  null false

  description "Play cards for the current round of a game"

  argument :game_id, Integer, required: true
  argument :user_card_ids, [Integer], required: true

  def resolve(game_id:, user_card_ids:)
    current_user = context[:current_user]
    user_game = current_user.user_games.find_by(game_id: game_id)

    if user_card_ids.count != user_game.game.current_round.black_card.pick
      raise GraphQL::ExecutionError.new("Must play #{user_game.game.current_round.black_card.pick} card(s).")
    end

    user_game.play_cards!(user_card_ids)
  end
end
