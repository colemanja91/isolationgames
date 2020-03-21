require 'rails_helper'

RSpec.describe UserGame, type: :model do
  let(:game) { create(:game, as_status: "started") }

  # make sure 10 cards are available
  it "deals 10 cards" do
    game.user_games.each do |user_game|
      expect(user_game.hand.count).to eq(10)
    end
  end

  it "allows cards to be played for pick 1" do
    game.current_round.update!(black_card: create(:black_card, pick: 1))
    game.user_games.each do |user_game|
      card_ids = user_game.hand.sample(1).pluck(:id)
      user_game.play_cards(card_ids)
      expect(game.current_round.reload.user_cards.pluck(:id)).to include(*card_ids)
    end
  end

  it "allows cards to be played for pick 2" do
    game.current_round.update!(black_card: create(:black_card, pick: 2))
    game.user_games.each do |user_game|
      card_ids = user_game.hand.sample(2).pluck(:id)
      user_game.play_cards(card_ids)
      expect(game.current_round.reload.user_cards.pluck(:id)).to include(*card_ids)
    end
  end

  it "does not allow multiple plays per round" do
    game.current_round.update!(black_card: create(:black_card, pick: 1))
    user_game = game.user_games.first
    card_ids = user_game.hand.sample(1).pluck(:id)
    user_game.play_cards(card_ids)
    card_ids = user_game.hand.sample(1).pluck(:id)
    expect { user_game.play_cards(card_ids) }.to raise_error(StandardError, "Cannot play cards multiple times in round")
  end

  it "does not allow plays after the game round is submitted" do
    game.current_round.update!(black_card: create(:black_card, pick: 1))
    game.current_round.submit!
    user_game = game.user_games.first
    card_ids = user_game.hand.sample(1).pluck(:id)
    expect { user_game.play_cards(card_ids) }.to raise_error(StandardError, "Cannot play cards after round is submitted")
  end
end
