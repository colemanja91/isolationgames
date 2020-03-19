require 'rails_helper'

RSpec.describe Mutations::AddVideoLink do
  let(:game) { create(:game) }

  let(:mutation) {
    <<~GQL
      mutation {
        addVideoLink(gameId: #{game.id}, videoLink:"https://videoservice.com") {
          id
          videoLink
        }
      }
    GQL
  }

  it "updates the video link" do
    expect(game.video_link).to be nil
    result = IsolationgamesSchema.execute(mutation, context: { current_user: game.user })["data"]["addVideoLink"]
    expect(result["videoLink"]).not_to be_nil
    game.reload
    expect(result["videoLink"]).to eq(game.video_link)
  end
end
