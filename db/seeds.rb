require 'faker'

User.create!(
  email: 'oscarmolivera@gmail.com',
  password: '123456',
  password_confirmation: '123456'
)
puts 'My User created!'

4.times do
  pass = Faker::Internet.password(min_length: 8)
  User.create!(
    email: Faker::Internet.email,
    password: pass,
    password_confirmation: pass,
  )
end
puts '4 Dummy users created!'

8.times do
  Language.create!(
    name: Faker::Verb.base.capitalize
  )
end
puts '8 Dummy Languages created!'

50.times do
  Word.create!(
    content: Faker::Lorem.word,
    language_id: Faker::Number.between(from: 1, to: 8),
    user_id: Faker::Number.between(from: 1, to: 5)
  )
end
puts '50 Words Created!'

25.times do
  Translation.create!(
    word_id: Faker::Number.between(from: 1, to: 50),
    translated_word_id: Faker::Number.between(from: 1, to: 50)
  )
end
puts '25 Translations Created!'
