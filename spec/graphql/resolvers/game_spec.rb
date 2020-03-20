require 'rails_helper'

RSpec.describe Resolvers::Game do
  let(:user) { create(:user) }
  let(:game) { create(:game, as_status: "started") }

  let(:query) {
    <<-GRAPHQL
      {
        game(gameName: "#{game.name}") {
          id
          currentRound {
            playedCards {
              id
              text
            }
          }
          gameOwner {
            displayName
          }
          name
          players{
            status
            userDisplayName
          }
          status
          startedAt
          videoLink
        }
      }
    GRAPHQL
  }

  context "game is live" do
    context "user has joined" do
      before do
        user.join_game!(game)
      end

      it "returns the game owner display name" do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })["data"]["game"]
        expect(result["gameOwner"]["displayName"]).to eq(game.user.display_name)
      end

      it "returns the players" do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })["data"]["game"]
        expect(game.user_games.count).to eq(2)
        expect(result["players"].count).to eq(game.user_games.count)
      end

      it "returns the game status" do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })["data"]["game"]
        expect(result["status"]).to eq("created")
      end

      it "returns empty array of playedCards if the round is not submitted" do
        expect(game.current_round.started?).to be true
        result = IsolationgamesSchema.execute(query, context: { current_user: user })["data"]["game"]
        expect(result["currentRound"]["playedCards"]).to be_empty
      end

      it "returns array of playedCards if the round is submitted" do
        expect(game.current_round.started?).to be true
        game.user_games.first.play_cards(game.user_games.first.hand.sample(1).pluck(:id))
        game.current_round.submit!
        result = IsolationgamesSchema.execute(query, context: { current_user: user })["data"]["game"]
        expect(result["currentRound"]["playedCards"]).not_to be_empty
      end
    end

    context "user has not joined" do
      it "errors" do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })
        expect(result["errors"]).not_to be_nil
      end
    end
  end

  context "game is ended" do
    it "errors" do
      user.join_game!(game)
      game.update!(status: :started)
      game.update!(status: :ended)
      result = IsolationgamesSchema.execute(query, context: { current_user: user })
      expect(result["errors"]).not_to be_nil
    end
  end
end
