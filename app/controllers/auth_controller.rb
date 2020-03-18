class AuthController < ApplicationController
  attr_reader :resp

  def signin
    render nothing: true, status: :bad_request && return unless params[:code]

    @resp = auth_code(params[:code])
    redirect_to '/' && return unless resp

    create_user_session

    # Alternatively, you could redirect to a saved URL
    redirect_to '/'
  end

  def signout
    if cognito_session_id == session[:cognito_session_id]
      cognito_session = CognitoSession.find(cognito_session_id)
      return unless cognito_session

      cognito_session.destroy
      session.delete(:cognito_session_id)
    end

    redirect_to '/'
  end

  private

  def create_user_session
    ActiveRecord::Base.transaction do
      cognito_session = user.cognito_sessions.create(
        expire_time: resp.id_token[:exp],
        issued_time: resp.id_token[:auth_time],
        audience: resp.id_token[:aud],
        refresh_token: resp.refresh_token
      )
      session[:cognito_session_id] = cognito_session.id
    end
  end

  def user
    User.find_by(subscriber: resp.id_token[:sub]).first ||
      User.create!(subscriber: resp.id_token[:sub], email: resp.id_token[:email])
  end

  def auth_code(code)
    cognito_client.get_pool_tokens(code)
  end
end
