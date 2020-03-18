require 'rails_helper'

RSpec.describe Mutations::JoinGame do
  let(:mutation_name) { described_class.name.demodulize.camelize(:lower) }
  let(:user) { create(:user) }
  let(:game) { create(:game) }

  def mutation(game_name)
    query = <<~GQL
      mutation {
        #{mutation_name}(gameName: "#{game_name}") {
          id
          name
        }
      }
    GQL

    IsolationgamesSchema.execute(query, context: { current_user: user })
  end

  it 'returns the game' do
    result = mutation(game.name)["data"][mutation_name]
    expect(Game.find(result["id"]).name).to eq(result["name"])
  end

  it "joins the user to the game" do
    expect { mutation(game.name) }.to(change{ user.user_games.count }.by 1)
  end

  it "returns the game if the user has already joined" do
    user.join_game!(game)
    result = mutation(game.name)["data"][mutation_name]
    expect(Game.find(result["id"]).name).to eq(result["name"])
  end

  it "does not create another user_game if they user has already joined" do
    user.join_game!(game)
    expect { mutation(game.name) }.not_to(change { user.user_games.count })
  end

  it "rejoins the user if they have already left" do
    user_game = user.join_game!(game)
    user_game.leave!
    result = mutation(game.name)["data"][mutation_name]
    expect(Game.find(result["id"]).name).to eq(result["name"])
  end

  it "raises an error if no game found" do
    result = mutation("thisisnotaname")
    expect(result["errors"]).not_to be_nil
  end

  it "raises an error if the game has ended" do
    game.start!
    game.end!
    result = mutation(game.name)
    expect(result["errors"]).not_to be_nil
  end
end
