FactoryBot.define do
  factory :game, class: Game do
    user
    transient do
      as_status { "created" }
    end

    after(:create) do |game, evaluator|
      game.user.join_game!(game)

      if evaluator.as_status == "started"
        (Game::MIN_PLAYERS - 1).times do
          user = create(:user)
          user.join_game!(game)
        end

        game.start!
      end
    end
  end
end
