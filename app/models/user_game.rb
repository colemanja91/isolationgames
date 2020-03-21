# frozen_string_literal: true

class UserGame < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :game
  has_many :user_cards

  validates :user, presence: true
  validates :game, presence: true
  validates_uniqueness_of :game, scope: :user

  CARDS = 10

  enum status: {
    joined: 0,
    left: 10
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    state :joined, initial: true
    state :left

    event :join do
      transitions from: :left, to: :joined
    end

    event :leave do
      transitions from: :joined, to: :left
    end
  end

  def draw_cards
    draw_card while user_cards.count < CARDS
  end

  def hand
    user_cards.available
  end

  def play_cards(user_card_ids)
    if game.current_round.submitted?
      raise StandardError, "Cannot play cards after round is submitted"
    end

    if user_cards.where(game_round: game.current_round).any?
      raise StandardError, "Cannot play cards multiple times in round"
    end

    transaction do
      hand.where(id: user_card_ids).each(&:play!)
    end
  end

  private

  def draw_card
    UserCard.transaction do
      used_white_card_ids = UserCard.where(user_game: game.user_games.pluck(:id)).pluck(:white_card_id)
      white_deck = WhiteCard.where.not(id: used_white_card_ids)
      offset = rand(white_deck.count)
      user_cards.create!(white_card: white_deck.offset(offset).first)
    end
  end
end
