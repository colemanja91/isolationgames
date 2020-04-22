# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    stored_location_for(resource_or_scope) || root_path
  end
end
