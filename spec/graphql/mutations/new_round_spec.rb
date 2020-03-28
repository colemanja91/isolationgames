# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::NewRound do
  let(:game) { create(:game, as_status: 'started') }

  let(:mutation) do
    <<~GQL
      mutation {
        newRound {
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
  end

  before do
    game.user_games.each do |user_game|
      pick = game.current_round.black_card.pick
      card_ids = user_game.hand.sample(pick).pluck(:id)
      user_game.play_cards(card_ids)
    end

    game.current_round.user_rounds.first.update!(winner: true)
  end

  it 'ends the existing round' do
    first_round = game.current_round
    expect(first_round.status).to eq('submitted')
    IsolationgamesSchema.execute(mutation, context: { current_user: game.user })
    expect(first_round.reload.status).to eq('ended')
  end

  it 'starts a new round' do
    first_round = game.current_round
    IsolationgamesSchema.execute(mutation, context: { current_user: game.user })
    expect(game.reload.current_round).not_to eq(first_round)
    expect(game.reload.current_round.status).to eq('started')
  end

  it 'returns the new round' do
    result = IsolationgamesSchema.execute(mutation, context: { current_user: game.user })['data']['newRound']
    expect(result['currentRound']['round']).to eq(game.reload.current_round.round)
    expect(result['currentRound']['blackCard']['text']).to eq(game.reload.current_round.black_card.text)
  end
end
