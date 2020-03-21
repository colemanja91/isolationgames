require 'rails_helper'

RSpec.describe Mutations::PlayCards do
  let(:game) { create(:game, as_status: "started") }
  let(:user) { game.user_games.last.user }

  def mutation(user_card_ids)
    <<~GQL
      mutation {
        playCards(gameId: #{game.id}, userCardIds: #{user_card_ids}) {
          id
          currentRound {
            round
            status
          }
        }
      }
    GQL
  end

  it "plays the cards" do
    pick = game.current_round.black_card.pick
    user_game = user.user_games.find_by(game: game)
    card_ids = user_game.hand.sample(pick).pluck(:id)
    IsolationgamesSchema.execute(mutation(card_ids), context: { current_user: user })
    expect(game.reload.current_round.user_cards.pluck(:id)).to include(*card_ids)
  end
end
