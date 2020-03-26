require 'rails_helper'

RSpec.describe Mutations::LeaveGame do
  let(:user) { create(:user) }
  let(:game) { create(:game, as_status: "started") }

  def mutation(game_id)
    <<~GQL
      mutation {
        leaveGame(gameId: #{game_id}) {
          id
          status
        }
      }
    GQL
  end

  before do
    user.join_game!(game)
  end

  it "marks the user as left" do
    expect(user.user_games.first.status).to eq("joined")
    IsolationgamesSchema.execute(mutation(game.id), context: { current_user: user })
    expect(user.reload.user_games.first.status).to eq("left")
  end

  it "ends the game if fewer than the required number of users" do
    expect(game.status).to eq("started")
    IsolationgamesSchema.execute(mutation(game.id), context: { current_user: user })
    IsolationgamesSchema.execute(mutation(game.id), context: { current_user: game.user_games.joined.last.user })
    expect(game.reload.status).to eq("ended")
  end
end
