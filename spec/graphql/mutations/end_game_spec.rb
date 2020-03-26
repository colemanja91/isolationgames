require 'rails_helper'

RSpec.describe Mutations::EndGame do
  let(:user) { create(:user) }
  let(:game) { create(:game, user: user, as_status: "started") }

  def mutation(game_id)
    <<~GQL
      mutation {
        endGame(gameId: #{game_id}) {
          id
          status
        }
      }
    GQL
  end

  it "ends the game" do
    expect(game.status).to eq("started")
    IsolationgamesSchema.execute(mutation(game.id), context: { current_user: user })
    expect(game.reload.status).to eq("ended")
  end
end
