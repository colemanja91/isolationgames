class Mutations::PickWinner < Types::BaseMutation
  null false

  description "Pick winning for the current round of a game"

  argument :game_id, Integer, required: true
  argument :user_card_id, Integer, required: true

  def resolve(game_id:, user_card_id:)
    current_user = context[:current_user]
    game = current_user.user_games.find_by(game_id: game_id).game

    unless game.current_round.user == current_user
      raise GraphQL::ExecutionError.new("Only the round judge can pick a winner.")
    end

    game.current_round.user_cards.find(user_card_id).update!(winner: true)
    game
  end
end
