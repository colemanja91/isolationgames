# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user) }
  let(:query) { '{user {id}}' }

  describe 'POST /graphql' do
    it 'works if user has a session' do
      post :execute, params: { query: query }, session: { current_user_id: user.id }

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data']['user']['id'].to_i).to eq(user.id)
    end

    it 'returns unauthorized if user is not authenticated' do
      post :execute, params: { query: query }

      expect(response).to have_http_status(:unauthorized)
    end

    it 'returns unauthorized if the user has an expired session' do
      session = user.cognito_sessions.create!(
        expire_time: Time.now.tv_sec - 3600,
        issued_at: Time.now.tv_sec - 3700,
        audience: 'test',
        refresh_token: 'token'
      )

      expect_any_instance_of(CognitoClient).to receive(:refresh_id_token).and_return nil
      post :execute, params: { query: query }, session: { cognito_session_id: session.id }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
