# frozen_string_literal: true

class AboutController < ApplicationController
  skip_before_action :authenticate_user!
  def about; end
end
