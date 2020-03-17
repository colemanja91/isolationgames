# frozen_string_literal: true

class NotificationProcessorJob < ShoryukenJob
  shoryuken_options queue: 'cah', auto_delete: true

  attr_reader :notification

  def perform(sqs_msg, notification_id)
    @notification = Notification.find(notification_id)

    if notification.user.name.nil?
      twilio_service.send("Hi there! We'll set you up to start playing, but first, what's your name?")
    end
  end

  private

  def twilio_service
    @twilio_service ||= TwilioService.new(user)
  end
end
