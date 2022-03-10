# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

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
  title: "The King 👑",
  description: "Finish top of the table in your next warzone game",
  odds: 2,
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646910074/MVG/ui_playercard_mc_damascus_pi_mike1911_fpaug4.webp')
challenge_1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_1.save!

challenge_2 = Challenge.new(
  title: "Assassin 🔪",
  description: "Get 5 knife kills in your next game",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646911158/MVG/ui_playercard_t9599_v1_i2j3kc.webp')
challenge_2.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_2.save!

challenge_3 = Challenge.new(
  title: "Lone Wolf 🐺",
  description: "Finish top in your next free for all warzone match",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646911175/MVG/ui_playercard_1050_umm5n7.webp')
challenge_3.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_3.save!

challenge_4 = Challenge.new(
  title: "Martyrdom 💀",
  description: "Achieve a kill from the grave in your next warzone match",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646911117/MVG/ui_playercard_016_lydw65.webp')
challenge_4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_4.save!

challenge_5 = Challenge.new(
  title: "Dreamwork 👨🏾‍🤝‍👨🏼",
  description: "Your team finish top in your next team deathmatch",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646910312/MVG/ui_playercard_t91019_gilgpg.webp')
challenge_5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_5.save!

challenge_6 = Challenge.new(
  title: "You Have Mail 📧",
  description: "Get 5 grenade kills in your next warzone match",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646910263/MVG/ui_playercard_003_stuisx.webp')
challenge_6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_6.save!

challenge_7 = Challenge.new(
  title: "Headhunter 🏴‍☠️",
  description: "Get 15 headshots in your next warzone match",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646916671/MVG/ui_playercard_t9174_nieyld.webp')
challenge_7.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_7.save!

challenge_8 = Challenge.new(
  title: "You Animal 🐒",
  description: "During your next match, kill an enemy with their own gun",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646910141/MVG/ui_playercard_t9845_t8o9pe.webp')
challenge_8.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_8.save!

challenge_9 = Challenge.new(
  title: "Death From Above 🚁",
  description: "Get a kill in your next warzone match whilst elevated from an enemy",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646910159/MVG/ui_playercard_t91060_wmlog4.webp')
challenge_9.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_9.save!

challenge_10 = Challenge.new(
  title: "AFK ⛄",
  description: "Survive 5 minutes in any gamemode",
  odds: 2
)
file = URI.open('https://res.cloudinary.com/dnwhaoklq/image/upload/v1646909658/MVG/ui_playercard_1516_tbjgs4.webp')
challenge_10.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
challenge_10.save!

# Bets
# bet_1 = Bet.new(
#   user: user,
#   challenge: Challenge.first,
#   wager: 5,
#   price_cents: 500,
#   # pretty sure we can condition the payout so that it takes wager + challenge.odds as params
#   payout: 10,
#   status: true
# )
# bet_1.save!

# bet_2 = Bet.new(
#   user: user,
#   challenge: Challenge.first,
#   wager: 10,
#   price_cents: 500,
#   payout: 20,
#   status: true
# )
# bet_2.save!

# bet_3 = Bet.new(
#   user: user,
#   challenge: Challenge.first,
#   wager: 6,
#   price_cents: 500,
#   payout: 15,
#   status: false
# )
# bet_3.save!

puts "completed! database looking fresh!"
