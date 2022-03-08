class WalletEntry < ApplicationRecord
  belongs_to :user
  monetize :amount_cents
end
