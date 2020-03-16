# frozen_string_literal: true

class WebhooksController < ApplicationController
  def webhook_receiver
    TwilioWebhookService.process(params.to_json)
    render json: {}, status: :success and return
  end
end
