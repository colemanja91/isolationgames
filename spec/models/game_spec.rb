# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  let(:game) { create(:game) }

  describe '#start!' do
    context 'enough players' do
      before do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)
        user1.join_game!(game)
        user2.join_game!(game)
        user3.join_game!(game)
      end

      it 'starts if enough players' do
        game.start!

        expect(game.status).to eq('started')
      end

      it 'starts a new game round' do
        expect { game.start! }.to(change { game.game_rounds.count }.by(1))
      end
    end
  end

  describe '#end!' do
    it 'ends the game' do
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user1.join_game!(game)
      user2.join_game!(game)
      user3.join_game!(game)

      game.start!
      game.end!
      expect(game.status).to eq('ended')
    end
  end
end
