# frozen_string_literal: true

class TwilioService
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def send(message)
    message = client.messages.create(
      from: ,
      to: user.phone_number,
      body: message
    )

    Notification.create!(
      user: user,
      direction: :outbound
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new(
      Rails.application.credentials.twilio.account_sid,
      Rails.application.credentials.twilio.auth_token
    )
  end
end
