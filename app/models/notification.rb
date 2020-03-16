# frozen_string_literal: true

class Notification < ApplicationRecord
  enum direction: {
    inbound: 0,
    outbound: 1
  }
end
