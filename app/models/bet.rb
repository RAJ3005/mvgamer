class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
  # monetize :price_cents
end
