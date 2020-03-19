require 'rails_helper'

RSpec.describe Mutations::UpdateUserName do
  let(:user) { create(:user) }

  let(:mutation) {
    <<~GQL
      mutation {
        updateUserName(name: "sisko") {
          id
          displayName
        }
      }
    GQL
  }

  it "updates the user's name" do
    expect(user.name).to be nil
    result = IsolationgamesSchema.execute(mutation, context: { current_user: user })["data"]["updateUserName"]
    expect(result["displayName"]).not_to be_nil
    user.reload
    expect(result["displayName"]).to eq(user.display_name)
    expect(result["displayName"]).to eq(user.name)
  end
end
