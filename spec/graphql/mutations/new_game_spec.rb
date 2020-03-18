require 'rails_helper'

RSpec.describe Mutations::NewGame do
  let(:mutation_name) { described_class.name.demodulize.camelize(:lower) }
  let(:user) { create(:user) }

  def mutation
    query = <<~GQL
      mutation {
        #{mutation_name} {
          id
          name
        }
      }
    GQL

    IsolationgamesSchema.execute(query, context: { current_user: user })
  end

  it 'returns the game' do
    result = mutation["data"][mutation_name]
    expect(Game.find(result["id"]).name).to eq(result["name"])
  end

  it 'joins the user to the game' do
    result = mutation["data"][mutation_name]
    game = Game.find(result["id"])

    expect(user.user_games.find_by(game: game)).not_to be_nil
  end
end
