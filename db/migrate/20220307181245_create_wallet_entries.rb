class CreateWalletEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :wallet_entries do |t|
      t.string :state
      t.monetize :amount
      t.string :checkout_session_id
      t.references :user, null: false, foreign_key: true
      t.references :bet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
