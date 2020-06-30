require 'factory_bot'
require 'faker'

FactoryBot.define do
  factory :language do |l|
    sequence :name do |n|
      "#{n}#{Faker::Verb.base.capitalize}"
    end

    #l.name {generate :name}
  end
end
