require 'faker'
require 'factory_bot'

FactoryBot.define do
  factory :word do |w|
    w.content { Faker::Lorem.word }
    language
    user

    trait :with_translations do
      after(:create) do |word|
        word.translations << (create_list :word, 5)
      end
    end
  end
end
