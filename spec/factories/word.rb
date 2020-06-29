require 'factory_bot'

FactoryBot.define do
  factory :word do |w|
    w.content { 'Home' }
    language
  end
end
