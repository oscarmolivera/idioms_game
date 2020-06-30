require 'faker'

8.times do
  Language.create!(
    name: Faker::Verb.base.capitalize
  )
end
puts '8 Dummy Languages created!'
