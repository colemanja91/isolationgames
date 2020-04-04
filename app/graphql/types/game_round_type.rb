# frozen_string_literal: true

class Types::GameRoundType < Types::BaseObject
  field :id, Integer, null: false
  field :black_card, Types::BlackCardType, null: false
  field :user_rounds, [Types::UserRoundType], null: false
  field :has_played, Boolean, null: false
  field :is_judge, Boolean, null: false
  field :round, Integer, null: false
  field :status, Types::GameRoundStatusEnum, null: false
  field :user, Types::UserType, null: false
  field :winner, Types::UserRoundType, null: true

  def game_round
    @object
  end

  def current_user
    @context[:current_user]
  end

  def has_played
    game_round.user_rounds.joins(:user_game).where(user_games: { user: current_user }).any?
  end

  def is_judge
    current_user == game_round.user
  end

  def user_rounds
    return game_round.user_rounds.order(:id) if game_round.submitted?

    []
  end
end
