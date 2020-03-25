require 'rails_helper'

RSpec.describe Mutations::PickWinner do
  let(:game) { create(:game, as_status: "started") }
  let(:judge) { game.current_round.user }

  def mutation(user_round_id)
    <<~GQL
      mutation {
        pickWinner(gameId: #{game.id}, userRoundId: #{user_round_id}) {
          id
          currentRound {
            winner {
              id
              userCards {
                text
              }
              user {
                displayName
              }
            }
          }
        }
      }
    GQL
  end

  def play_cards
    game.user_games.each do |user_game|
      pick = game.current_round.black_card.pick
      card_ids = user_game.hand.sample(pick).pluck(:id)
      user_game.play_cards(card_ids)
      expect(game.current_round.reload.user_rounds.joins(:user_cards).pluck("user_cards.id")).to include(*card_ids)
    end
  end

  it "marks the specified card as winner" do
    play_cards
    winner = game.current_round.user_rounds.first
    IsolationgamesSchema.execute(mutation(winner.id), context: { current_user: judge })
    expect(game.reload.current_round.winner).to eq(winner)
  end

  it "returns the winning card" do
    play_cards
    winner = game.current_round.user_rounds.first
    result = IsolationgamesSchema.execute(mutation(winner.id), context: { current_user: judge })["data"]["pickWinner"]
    expect(result["currentRound"]["winner"]["id"]).to eq(winner.id)
  end

  it "errors if user is not the judge" do
    user = game.user_games.where.not(user_id: judge.id).first.user
    play_cards
    winner = game.current_round.user_rounds.first
    result = IsolationgamesSchema.execute(mutation(winner.id), context: { current_user: user })
    expect(result["errors"]).not_to be nil
  end
end
