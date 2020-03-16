# frozen_string_literal: true

class TwilioWebhooksController < ApplicationController
  def webhook_receiver
    TwilioWebhookService.process(params)
    render json: {}, status: :ok and return
  end
end
