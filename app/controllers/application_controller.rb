# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    stored_location_for(resource_or_scope) || root_path
  end
end
