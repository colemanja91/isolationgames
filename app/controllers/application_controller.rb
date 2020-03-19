require 'cognito_jwt_keys'
require 'cognito_client'

class ApplicationController < ActionController::Base
  before_action :check_signed_in

  def check_signed_in
    if Rails.env.development?
      local_signin && return
    end

    @is_signed_in = false
    @current_user = nil
    @cognito_session = nil

    unauthorized unless session[:cognito_session_id]

    cognito_session = begin
      CognitoSession.find(session[:cognito_session_id])
    rescue ActiveRecord::RecordNotFound
      return
    end

    unauthorized unless cognito_session

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
    unauthorized unless refresh_cognito_session(cognito_session)

    @is_signed_in = true
    @current_user = cognito_session.user
    @cognito_session = cognito_session
  end

  private

  def unauthorized
    head :unauthorized
  end

  # Testing locally is a pain...
  def local_signin
    @is_signed_in = true
    @current_user = User.local_account
    @cognito_session = @current_user.cognito_sessions.create!(
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
