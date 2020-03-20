require 'rails_helper'

RSpec.describe GameRound, type: :model do
  let(:game) { create(:game, as_status: "started") }

  def new_round
    game.current_round.submit!
    game.current_round.end!
    game.start_round!
  end

  it "picks a random black card" do
    expect(game.current_round.black_card).not_to be nil
  end

  it "sets the round number" do
    expect(game.reload.current_round.round).to eq(1)
    new_round
    expect(game.reload.current_round.round).to eq(2)
  end

  it "picks a successive players to be the judge" do
    expect(game.reload.current_round.user).to eq(game.user)
    new_round
    expect(game.reload.current_round.user).to eq(game.user_games[1].user)
    new_round
    expect(game.reload.current_round.user).to eq(game.user_games[2].user)
    new_round
    expect(game.reload.current_round.user).to eq(game.user_games[3].user)
  end

  describe "#check_status!" do
    context "all users have played cards" do
      it "transitions to submitted" do
        allow_any_instance_of(GameRound).to receive(:check_status!)

      end
    end

    context "not all users have played cards" do
      it "does not transition" do

      end
    end
  end
end
