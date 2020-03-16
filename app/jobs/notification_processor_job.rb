# frozen_string_literal: true

class NewGameJob < ApplicationJob
  queue_as 'cah'

  attr_reader :notification

  def perform(notification_id)
    @notification = Notification.find(notification_id)
  end
end
