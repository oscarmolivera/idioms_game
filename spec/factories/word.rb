require 'faker'
require 'factory_bot'

FactoryBot.define do
  factory :word do |w|
    w.content { Faker::Lorem.word }
    language
    user
  end
end
