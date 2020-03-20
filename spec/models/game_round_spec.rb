require 'rails_helper'

RSpec.describe GameRound, type: :model do
  let(:game) { create(:game) }
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }
  let(:user3) { create(:user) }
  let(:user4) { create(:user) }

  before do
    user1.join_game!(game)
    user2.join_game!(game)
    user3.join_game!(game)
    user4.join_game!(game)
  end

  def new_round
    game.current_round.submit!
    game.current_round.end!
    game.start_round!
  end

  it "picks a random black card" do
    game.start!
    expect(game.current_round.black_card).not_to be nil
  end

  it "sets the round number" do
    game.start!
    expect(game.reload.current_round.round).to eq(1)
    new_round
    expect(game.reload.current_round.round).to eq(2)
  end

  it "picks a successive players to be the judge" do
    game.start!
    expect(game.reload.current_round.user).to eq(game.user)
    new_round
    expect(game.reload.current_round.user).to eq(user1)
    new_round
    expect(game.reload.current_round.user).to eq(user2)
    new_round
    expect(game.reload.current_round.user).to eq(user3)
    new_round
    expect(game.reload.current_round.user).to eq(user4)
  end
end
