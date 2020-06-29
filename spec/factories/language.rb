require 'factory_bot'

FactoryBot.define do
  factory :language do |l|
    l.name { 'English' }
  end
end
