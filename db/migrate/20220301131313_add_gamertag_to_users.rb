class AddGamertagToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gamertag, :string
  end
end
