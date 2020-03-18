FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.unique.email }
    subscriber { Faker::Alphanumeric.alpha(number: 10) }
  end
end
