# frozen_string_literal: true

class LoginController < ApplicationController
  skip_before_action :authenticate_user!
  def login; end
end
