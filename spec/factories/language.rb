require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :language do |l|
    sequence :name do |n|
      "#{n}#{Faker::Verb.base.capitalize}"
    end

    trait :spanish do
      name { 'Español' }
    end
  end
end
