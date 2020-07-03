require 'faker'

User.create!(
  email: 'oscarmolivera@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)
puts 'My User created!'

8.times do
  Language.create!(
    name: Faker::Verb.base.capitalize
  )
end
puts '8 Dummy Languages created!'
