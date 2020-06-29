require 'factory_bot'

FactoryBot.define do
  factory :word do |w|
    w.content { 'Home' }
    w.language { 'English' }
  end
end
