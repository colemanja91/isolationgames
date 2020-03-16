require "rails_helper"

RSpec.describe TwilioWebhookService do
  describe "#process" do
    let(:default_params) do
      {
        ToCountry: "US",
        ToState: "AL",
        SmsMessageSid: "SMb03122539b22a708f01d969b150bbc71",
        NumMedia: "0",
        ToCity: "BIRMINGHAM",
        FromZip: "28655",
        SmsSid: "SMb03122539b22a708f01d969b150bbc71",
        FromState: "NC",
        SmsStatus: "received",
        FromCity: "MORGANTON",
        Body: "Hello there",
        FromCountry: "US",
        To: "+12057073097",
        ToZip: "35203",
        NumSegments: "1",
        MessageSid: "SMb03122539b22a708f01d969b150bbc71",
        AccountSid: "AC664faa0af7318a7b5df03248cbc3d4bd",
        From: "+18284436327",
        ApiVersion: "2010-04-01"
      }
    end

    it "creates a new user" do
      expect {
        TwilioWebhookService.new(default_params).process
      }.to change {
        User.count
      }.by(1)
    end

    it "creates a new notification" do
      expect {
        TwilioWebhookService.new(default_params).process
      }.to change {
        Notification.count
      }.by(1)
    end
  end
end
