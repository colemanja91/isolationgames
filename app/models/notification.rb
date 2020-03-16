# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :user

  enum direction: {
    inbound: 0,
    outbound: 1
  }
end
