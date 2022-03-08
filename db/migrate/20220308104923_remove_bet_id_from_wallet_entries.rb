class RemoveBetIdFromWalletEntries < ActiveRecord::Migration[6.1]
  def change
    remove_column :wallet_entries, :bet_id
  end
end
