# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.unique.email }
    uid { Faker::Alphanumeric.alpha(number: 10) }
  end
end
