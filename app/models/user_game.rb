# frozen_string_literal: true

class UserGame < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :game
  has_many :user_cards
  has_many :user_rounds

  validates :user, presence: true
  validates :game, presence: true
  validates_uniqueness_of :game, scope: :user
  validate :only_one_active_per_user

  after_commit :check_cards

  CARDS = 10

  enum status: {
    joined: 0,
    left: 10
  }

  aasm column: :status, enum: true, whiny_persistance: true do
    after_all_transitions :track_transition
    state :joined, initial: true
    state :left

    event :join do
      transitions from: :left, to: :joined, after: :check_cards
    end

    event :leave do
      transitions from: :joined, to: :left
    end
  end

  def draw_cards
    draw_card while hand.count < CARDS
  end

  def hand
    user_cards.available
  end

  def won_rounds
    user_rounds.winner.count
  end

  def play_cards(user_card_ids)
    if game.current_round.submitted?
      raise StandardError, 'Cannot play cards after round is submitted'
    end

    if user_rounds.where(game_round: game.current_round).any?
      raise StandardError, 'Cannot play cards multiple times in round'
    end

    cards = hand.where(id: user_card_ids)
    user_round = user_rounds.create!(game_round: game.current_round)
    cards.update_all(user_round_id: user_round.id)
    cards.each(&:play!)

    game.current_round.check_status!
  end

  private

  def check_cards
    draw_cards if game.started?
  end

  def draw_card
    UserCard.transaction do
      used_white_card_ids = UserCard.where(user_game: game.user_games.pluck(:id)).pluck(:white_card_id)
      white_deck = WhiteCard.where.not(id: used_white_card_ids)
      offset = rand(white_deck.count)
      user_cards.create!(white_card: white_deck.offset(offset).first)
    end
  end

  def only_one_active_per_user
    user.current_game.nil?
  end

  def track_transition
    timestamp_setter = "#{aasm.to_state}_at="
    public_send(timestamp_setter, Time.current) if respond_to?(timestamp_setter)
  end
end
