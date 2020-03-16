Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/api/twilio/webhooks", to: "twilio_webhooks#webhook_receiver"
end
