# frozen_string_literal: true

class TwilioWebhooksController < ApplicationController
  def webhook_receiver
    TwilioWebhookService.new(params).process
    render json: {}, status: :ok and return
  end
end
