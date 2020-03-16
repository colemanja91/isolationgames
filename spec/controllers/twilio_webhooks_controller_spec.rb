require "rails_helper"

RSpec.describe TwilioWebhooksController, type: :controller do
  describe "webhook_receiver" do
    let(:params) do
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

    it "calls service to process" do
      expect_any_instance_of(TwilioWebhookService).to receive(:process)
      post :webhook_receiver, params: params

      expect(response).to have_http_status(:ok)
    end
  end
end
