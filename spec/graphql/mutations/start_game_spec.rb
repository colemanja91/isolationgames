require 'rails_helper'

RSpec.describe Mutations::StartGame do
  let(:game) { create(:game) }

  let(:mutation) {
    <<~GQL
      mutation {
        startGame(gameId: #{game.id}) {
          id
          currentRound {
            user {
              id
            }
            blackCard {
              text
              pick
            }
            round
            status
          }
        }
      }
    GQL
  }

  before do
    3.times do
      user = create(:user)
      user.join_game!(game)
    end
  end

  it "starts the game" do
    expect(game.status).to eq("created")
    IsolationgamesSchema.execute(mutation, context: { current_user: game.user })
    expect(game.reload.status).to eq("started")
  end

  it "returns info on the current round" do
    result = IsolationgamesSchema.execute(mutation, context: { current_user: game.user })["data"]["startGame"]
    expect(result["currentRound"]["round"]).to eq(game.current_round.round)
    expect(result["currentRound"]["blackCard"]["text"]).to eq(game.current_round.black_card.text)
  end
end
