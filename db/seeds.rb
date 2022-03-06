# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database..."

Bet.destroy_all
User.destroy_all
Challenge.destroy_all

user = User.new(
  email: "gamer@mvgamer.co.uk",
  gamertag: "RJ3000%2321963",
  password: "123456"
)

5.times do
  challenge = Challenge.new(
    title: "Kill Race",
    description: "Achieve 6 kills or more in your next Warzone battle royale match",
    odds: 2
  )
  challenge.save!
end

# Bets
bet_1 = Bet.new(
  user: user,
  challenge: Challenge.first,
  wager: 5,
  payout: 10,
  status: true
)
bet_1.save!

bet_2 = Bet.new(
  user: user,
  challenge: Challenge.first,
  wager: 5,
  payout: 20,
  status: true
)
bet_1.save!

bet_3 = Bet.new(
  user: user,
  challenge: Challenge.first,
  wager: 6,
  payout: 15,
  status: false
)
bet_1.save!

puts "completed! database looking fresh!"
