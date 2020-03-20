FactoryBot.define do
  factory :black_card, class: BlackCard do
    text { "lorem ipsum _." }
    pick { Faker::Number.between(1,2) }
    card_set
  end
end
