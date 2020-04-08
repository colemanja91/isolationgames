# frozen_string_literal: true

class AuthController < ActionController::Base
  attr_reader :resp

  def signin
    render nothing: true, status: :bad_request && return unless params[:code]

    @resp = auth_code(params[:code])
    Rails.logger.info(params[:code])
    Rails.logger.info(resp)
    redirect_to '/' && return unless resp

    session[:current_user_id] = user.id

    redirect_to '/'
  end

  def signout
    reset_session

    redirect_to '/'
  end

  private

  def user
    return User.local_account if Rails.env.development?

    User.find_by(subscriber: resp.id_token[:sub]).first ||
      User.create!(subscriber: resp.id_token[:sub], email: resp.id_token[:email])
  end

  def auth_code(code)
    cognito_client.get_pool_tokens(code)
  end
end
