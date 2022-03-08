# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database..."

Bet.destroy_all
puts "data destroyed - bet"
WalletEntry.destroy_all
puts "data destroyed - wallet"
User.destroy_all
puts "data destroyed"
Challenge.destroy_all
puts "data destroyed - challenge"
# users
user = User.new(
  email: "gamer@mvgamer.co.uk",
  gamertag: "RJ3000%2321963",
  password: "123456",
  account_balance: 0
)
user.save!

# wallet
wallet_entry = WalletEntry.new(
  state: 'pending',
  amount_cents: 0,
  amount_currency: "gbp",
  user: user,
  total: 0
)
wallet_entry.save!

# challenges
challenge_1 = Challenge.new(
  title: "Kill Race - 3 kills",
  description: "Achieve 3 kills or more in your next Warzone battle royale match",
  odds: 2
)
challenge_1.save!

challenge_2 = Challenge.new(
  title: "Kill Race - 4 kills",
  description: "Achieve 4 kills or more in your next Warzone battle royale match",
  odds: 2
)
challenge_2.save!

challenge_3 = Challenge.new(
  title: "Kill Race - 5 kills",
  description: "Achieve 5 kills or more in your next Warzone battle royale match",
  odds: 2
)
challenge_3.save!

challenge_4 = Challenge.new(
  title: "Kill Race - 6 kills",
  description: "Achieve 6 kills or more in your next Warzone battle royale match",
  odds: 2
)
challenge_4.save!

challenge_5 = Challenge.new(
  title: "Kill Race - 10 kills",
  description: "Achieve 10 kills or more in your next Warzone battle royale match",
  odds: 2
)
challenge_5.save!

challenge_6 = Challenge.new(
  title: "Team Placement - top 30",
  description: "You and your team must score in the top 30 in your next Warzone match",
  odds: 2
)
challenge_6.save!

challenge_7 = Challenge.new(
  title: "Team Placement - top 10",
  description: "You and your team must score in the top 10 in your next Warzone match",
  odds: 2
)
challenge_7.save!

challenge_8 = Challenge.new(
  title: "Team Placement - top 5",
  description: "You and your team must score in the top 5 in your next Warzone match",
  odds: 2
)
challenge_8.save!

challenge_9 = Challenge.new(
  title: "Team Placement - top 3",
  description: "You and your team must score in the top 3 in your next Warzone match",
  odds: 2
)
challenge_9.save!

challenge_10 = Challenge.new(
  title: "Team Placement - top 1",
  description: "You and your team must score in the top 1 in your next Warzone match",
  odds: 2
)
challenge_10.save!

# Bets
bet_1 = Bet.new(
  user: user,
  challenge: Challenge.first,
  wager: 5,
  price_cents: 500,
  # pretty sure we can condition the payout so that it takes wager + challenge.odds as params
  payout: 10,
  status: true
)
bet_1.save!

bet_2 = Bet.new(
  user: user,
  challenge: Challenge.first,
  wager: 10,
  price_cents: 500,
  payout: 20,
  status: true
)
bet_2.save!

bet_3 = Bet.new(
  user: user,
  challenge: Challenge.first,
  wager: 6,
  price_cents: 500,
  payout: 15,
  status: false
)
bet_3.save!

puts "completed! database looking fresh!"
