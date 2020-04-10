# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  def google_oauth2
    user = User.from_google(from_google_params)

    if user
      Rails.logger.info("Found user for #{from_google_params.email}")
      sign_in_and_redirect user
    else
      Rails.logger.info("User not found for #{from_google_params.email}")
      redirect_to new_user_session_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      avatar_url: auth.info.image
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
