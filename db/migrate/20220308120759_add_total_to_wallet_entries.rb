class AddTotalToWalletEntries < ActiveRecord::Migration[6.1]
  def change
    add_column :wallet_entries, :total, :integer
  end
end
