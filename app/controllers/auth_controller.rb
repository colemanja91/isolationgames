# frozen_string_literal: true

class AuthController < ApplicationController
  attr_reader :resp

  def signin
    render nothing: true, status: :bad_request && return unless params[:code]

    @resp = auth_code(params[:code])
    redirect_to '/' && return unless resp

    session[:cognito_session_id] = user.id

    redirect_to '/'
  end

  def signout
    reset_session

    redirect_to '/'
  end

  private

  def user
    User.find_by(subscriber: resp.id_token[:sub]).first ||
      User.create!(subscriber: resp.id_token[:sub], email: resp.id_token[:email])
  end

  def auth_code(code)
    cognito_client.get_pool_tokens(code)
  end
end
