require 'factory_bot'

FactoryBot.define do
  factory :word do |w|
    w.content { 'Home' }
    w.language { 'english' }
  end
end
