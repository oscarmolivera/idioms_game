require 'factory_bot'

FactoryBot.define do
  factory :word do |w|
    w.value { 'Home' }
    w.language { 'english' }
  end
end
