# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Gossip.destroy_all
User.destroy_all
City.destroy_all
Comment.destroy_all
puts 'Cleaned DB'

Faker::Config.locale = 'fr'
puts 'Set Locale to fr'

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
puts "added #{City.all.size} cities"

20.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create!(
    first_name: first_name, last_name: last_name,
    password: '123456',
    description: Faker::Lorem.sentences(number: 5).join(' '),
    email: Faker::Internet.email(name: first_name.parameterize + ' ' + last_name.parameterize), age: rand(15..99),
    city: City.all.sample
  )
end
puts "added #{User.all.size} users"

30.times do
  gossip = Gossip.create(
    title: Faker::Lorem.characters(number: 10),
    content: Faker::Lorem.sentences(number: 5).join(' '),
    author: User.all.sample
  )
end
puts "added #{Gossip.all.size} gossips"

120.times do
  Comment.create(
    content: Faker::Lorem.sentences(number: 5).join(' '),
    commentable: (Gossip.all + Comment.all).sample,
    author: User.all.sample
  )
end
puts "added #{Comment.all.size} comments"

120.times do
  Like.create(
    gossip: Gossip.all.sample,
    user: User.all.sample
  )
end
puts "added #{Like.all.size} comments"
