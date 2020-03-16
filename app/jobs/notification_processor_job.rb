# frozen_string_literal: true

class NotificationProcessorJob < ShoryukenJob
  shoryuken_options queue: 'cah', auto_delete: true

  attr_reader :notification

  def perform(sqs_msg, notification_id)
    @notification = Notification.find(notification_id)
  end
end
