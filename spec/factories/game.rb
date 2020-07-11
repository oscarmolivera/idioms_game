require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :game do |g|
    g.good_answers_count { Faker::Number.between(from: 1, to: 8) }
    g.bad_answers_count { Faker::Number.between(from: 1, to: 8) }
    user
  end
end