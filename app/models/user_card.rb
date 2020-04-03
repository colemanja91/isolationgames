# frozen_string_literal: true

class UserCard < ApplicationRecord
  include AASM
  belongs_to :user_game
  belongs_to :white_card
  belongs_to :user_round, optional: true

  validates :user_game, presence: true
  validates :white_card, presence: true

  enum status: {
    available: 0,
    played: 10
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    after_all_transitions :track_transition
    state :available, initial: true
    state :played

    event :play do
      transitions from: :available, to: :played, after: :play_card!
    end
  end

  private

  def track_transition
    timestamp_setter = "#{aasm.to_state}_at="
    public_send(timestamp_setter, Time.current) if respond_to?(timestamp_setter)
  end
end
