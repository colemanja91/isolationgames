# frozen_string_literal: true

class TwilioWebhookService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def process
    user.update!(
      zipcode: params[:FromZip],
      country: params[:FromCountry]
    )

    notification
  end

  private

  def user
    @user ||= User.find_or_create_by!(
      phone_number: params[:From]
    )
  end

  def notification
    @notification ||= Notification.create!(
      user: user,
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
end
