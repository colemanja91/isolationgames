require 'rails_helper'

RSpec.describe Mutations::NewGame do
  let(:mutation_name) { described_class.name.demodulize.camelize(:lower) }
  let(:phone_number) { Faker::PhoneNumber.cell_phone }

  def mutation
    query = <<~GQL
      mutation {
        #{mutation_name}(phoneNumber: "#{phone_number}") {
          id
          name
        }
      }
    GQL

    IsolationgamesSchema.execute(query)
  end

  it 'returns the game' do
    result = mutation["data"][mutation_name]
    expect(Game.find(result["id"]).name).to eq(result["name"])
  end

  it 'creates a new user if one does not exist' do
    expect{ mutation }.to change { User.count }.by 1
  end

  it 'does not create a new user if the user already exists' do
    User.create!(phone_number: phone_number)
    expect{ mutation }.not_to(change{ User.count })
  end

  it 'joins the user to the game' do
    user = User.create!(phone_number: phone_number)
    result = mutation["data"][mutation_name]
    game = Game.find(result["id"])

    expect(user.user_games.find_by(game: game)).not_to be_nil
  end
end
