# frozen_string_literal: true

class TwilioWebhookService
  def self.process(params)
    new(params).process
  end

  def initialize(params)
    @notification = Notification.create!(
      phone_number: params['From'],
      message_body: params['Body'].downcase,
      direction: :inbound
    )
  end

  def route
    NotificationProcessorJob.perform_async(@notification.id)
  end
end
