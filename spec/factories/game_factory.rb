FactoryBot.define do
  factory :game, class: Game do
    user

    after(:create) do |game, _|
      game.user.join_game!(game)
    end
  end
end
