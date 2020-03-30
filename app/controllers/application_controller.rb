# frozen_string_literal: true

require 'cognito_jwt_keys'
require 'cognito_client'

class ApplicationController < ActionController::Base
  before_action :check_signed_in

  def check_signed_in
    local_signin && return if Rails.env.development?

    @is_signed_in = false
    @current_user = User.find_by_id(session[:current_user_id])

    unauthorized unless @current_user

    @is_signed_in = true
  end

  private

  def unauthorized
    head :unauthorized
  end

  # Testing locally is a pain...
  def local_signin
    @is_signed_in = true
    @current_user = User.local_account
  end
end
