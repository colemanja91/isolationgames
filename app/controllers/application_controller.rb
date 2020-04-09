# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_signed_in

  def check_signed_in
    return if request.fullpath == '/about-public'

    local_signin && return if Rails.env.development?
  end

  private

  # Testing locally is a pain...
  def local_signin
    @is_signed_in = true
    @current_user = User.local_account
  end
end
