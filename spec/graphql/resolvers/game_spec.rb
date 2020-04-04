# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Game do
  let(:user) { create(:user) }
  let(:game) { create(:game, as_status: 'started') }

  let(:query) do
    <<-GRAPHQL
      {
        game {
          id
          currentRound {
            blackCard {
              text
              pick
            }
            userRounds {
              id
              userCards {
                text
              }
            }
            round
            status
          }
          gameOwner {
            displayName
          }
          hand {
            id
            text
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
  end

  context 'game is live' do
    context 'user has joined' do
      before do
        user.join_game!(game)
      end

      it 'returns the game owner display name' do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })['data']['game']
        expect(result['gameOwner']['displayName']).to eq(game.user.display_name)
      end

      it 'returns the players' do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })['data']['game']
        expect(result['players'].count).to eq(game.user_games.count)
      end

      it 'returns the game status' do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })['data']['game']
        expect(result['status']).to eq(game.status)
      end

      it 'returns empty array of playedCards if the round is not submitted' do
        expect(game.current_round.started?).to be true
        result = IsolationgamesSchema.execute(query, context: { current_user: user })['data']['game']
        expect(result['currentRound']['userRounds']).to be_empty
      end

      it 'returns array of playedCards if the round is submitted' do
        expect(game.current_round.started?).to be true
        game.user_games.first.play_cards(game.user_games.first.hand.sample(1).pluck(:id))
        game.current_round.submit!
        result = IsolationgamesSchema.execute(query, context: { current_user: user })['data']['game']
        expect(result['currentRound']['userRounds']).not_to be_empty
      end

      it "returns the user's hand" do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })['data']['game']
        expect(result['hand'].pluck('id')).to eq(user.user_games.first.hand.order(id: :desc).pluck(:id))
      end
    end

    context 'user has not joined' do
      it 'returns null' do
        result = IsolationgamesSchema.execute(query, context: { current_user: user })
        expect(result['data']['game']).to be_nil
      end
    end
  end
end
