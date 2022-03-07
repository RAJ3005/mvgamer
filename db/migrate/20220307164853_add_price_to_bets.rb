class AddPriceToBets < ActiveRecord::Migration[6.1]
  def change
    add_monetize :bets, :price
  end
end
