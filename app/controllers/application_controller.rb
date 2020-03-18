require 'cognito_jwt_keys'
require 'cognito_client'

class ApplicationController < ActionController::Base
  before_action :check_signed_in

  def check_signed_in
    if Rails.env.development? || Rails.env.test?
      local_signin && return
    end

    @is_signed_in = false
    @current_user = nil
    @cognito_session = nil

    cognito_session = nil
    if session[:cognito_session_id]
      begin
        cognito_session = CognitoSession.find(session[:cognito_session_id])
      rescue ActiveRecord::RecordNotFound
        return
      end
    end

    now = Time.now.tv_sec

    if cognito_session.expire_time > now
      Rails.logger.info("Found a non-expired cognito session: #{cognito_session.id}")
      @is_signed_in = true
      @current_user = cognito_session.user
      @cognito_session = cognito_session
      return
    end

    Rails.logger.info("Refreshing cognito session: #{cognito_session.id}")

    # Need to refresh token
    return unless refresh_cognito_session(cognito_session)

    @is_signed_in = true
    @current_user = cognito_session.user
    @cognito_session = cognito_session
  end

  private

  # Testing locally is a pain...
  def local_signin
    @is_signed_in = true
    @current_user = User.local_account
    @cognito_session = @current_user.cognito_session.create!(
      expire_time: Time.now.tv_sec + 3600,
      issued_at: Time.now.tv_sec,
      audience: "test",
      refresh_token: "token"
    )
  end

  def refresh_cognito_session(cognito_session)
    client = cognito_client

    resp = client.refresh_id_token(cognito_session.refresh_token)

    return false unless resp

    cognito_session.expire_time = resp.id_token[:exp]
    cognito_session.issued_time = resp.id_token[:auth_time]
    cognito_session.audience = resp.id_token[:aud]

    cognito_session.save!
  end

  def cognito_client
    @cognito_client ||= CognitoClient.new(redirect_uri: auth_sign_in_url)
  end
end
