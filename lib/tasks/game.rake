# frozen_string_literal: true

desc 'Raises exception if used in production'
task skip_prod: [:environment] do
  raise 'You cannot run this in production' if Rails.env.production?
end

namespace :game do
  desc 'Create a new game not owned by local user'
  task new_game: :environment do
    user = User.create!(email: Faker::Internet.unique.email, subscriber: Faker::Alphanumeric.alpha(number: 10))

    mutation = <<~GQL
      mutation {
        newGame {
          id
        }
      }
    GQL

    IsolationgamesSchema.execute(mutation, context: { current_user: user })

    pp user.games.first.name
  end

  desc 'Create a new user and join them to the current game'
  task new_player: :environment do
    current_game = User.local_account.current_game.game
    user = User.create!(email: Faker::Internet.unique.email, subscriber: Faker::Alphanumeric.alpha(number: 10))
    user.join_game!(current_game)
  end

  desc 'Pick a random, non-owner, non-judge player and leave the game'
  task player_random_leave: :environment do
    mutation = <<~GQL
      mutation {
        leaveGame {
          id
        }
      }
    GQL

    current_game = User.local_account.current_game.game
    user = current_game.user_games.where.not(user: current_game.current_round.user).where.not(user: current_game.user).first.user
    IsolationgamesSchema.execute(mutation, context: { current_user: user })
  end

  desc 'End game (as the owner)'
  task end: :environment do
    mutation = <<~GQL
      mutation {
        endGame {
          id
        }
      }
    GQL

    user = User.local_account.current_game.game.user
    IsolationgamesSchema.execute(mutation, context: { current_user: user })
  end

  desc 'Start game (as the owner)'
  task start: :environment do
    mutation = <<~GQL
      mutation {
        startGame {
          id
        }
      }
    GQL

    user = User.local_account.current_game.game.user
    IsolationgamesSchema.execute(mutation, context: { current_user: user })
  end

  desc 'All other users play random card from their hand'
  task play_cards: :environment do
    current_game = User.local_account.current_game.game
    pick = current_game.current_round.black_card.pick
    judge = current_game.current_round.user
    current_game.user_games.joined.where.not(user: User.local_account).where.not(user: judge).each do |user_game|
      if user_game.user_rounds.where(game_round: current_game.current_round).any?
        next
      end

      user_card_ids = user_game.hand.sample(pick).pluck(:id)

      mutation = <<~GQL
        mutation {
          playCards( userCardIds: #{user_card_ids}) {
            id
          }
        }
      GQL

      IsolationgamesSchema.execute(mutation, context: { current_user: user_game.user })
    end
  end

  desc 'Judge randomly picks a winner'
  task judge_winner: :environment do
    current_game = User.local_account.current_game.game
    judge = current_game.current_round.user
    winner = current_game.current_round.user_rounds.sample(1).first

    mutation = <<~GQL
      mutation {
        pickWinner(userRoundId: #{winner.id}) {
          id
        }
      }
    GQL

    IsolationgamesSchema.execute(mutation, context: { current_user: judge })
  end

  desc 'Judge starts a new round'
  task new_round: :environment do
    current_game = User.local_account.current_game.game
    judge = current_game.current_round.user

    mutation = <<~GQL
      mutation {
        newRound {
          id
        }
      }
    GQL

    IsolationgamesSchema.execute(mutation, context: { current_user: judge })
  end
end
