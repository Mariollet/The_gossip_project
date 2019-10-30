# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

city_array = []
5.times do |i|
  c = City.create(name: Faker::Address.city)
  city_array << c
  puts "#{i+=1} Villes créer"
end
user_array = []
20.times do |i|
  u = User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: city_array.sample)
  user_array << u
  puts "#{i+=1} Auteurs créer"
end
gossip_array = []
50.times do |i|
  g = Gossip.create!(title: Faker::Verb.base,
    content: Faker::ChuckNorris.fact,
    user: user_array.sample,
    city: city_array.sample)
  gossip_array << g
  puts "#{i+=1} Gossips créer" 
end
