# frozen_string_literal: true

class WhiteCard < ApplicationRecord
  belongs_to :card_set
  has_many :user_cards
end
