# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database..."

# User.destroy_all
Challenge.destroy_all

user = User.new(email: "gamer@mvgamer.co.uk", gamertag: "gamer", password: "123456")
5.times do
  challenge = Challenge.new(
    title: "Kill Race",
    description: "Achieve 6 kills or more in your next Warzone battle royale match",
    odds: 2
  )
  challenge.save!
end

puts "completed! database looking fresh!"
