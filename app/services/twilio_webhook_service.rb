# frozen_string_literal: true

class TwilioWebhookService
  def self.process(params)
    new(params).process
  end

  def initialize(params)
    puts params

    @notification = Notification.create!(
      phone_number: params[:From],
      message_body: params[:Body].downcase,
      sms_message_sid: params[:SmsMessageSid],
      message_sid: params[:MessageSid],
      account_sid: params[:AccountSid],
      from_zip: params[:FromZip],
      from_state: params[:FromState],
      from_country: params[:FromCountry],
      from_city: params[:FromCity],
      direction: :inbound
    )
  end

  def process
  end
end
