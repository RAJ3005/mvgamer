class CreateBets < ActiveRecord::Migration[6.1]
  def change
    create_table :bets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge, null: false, foreign_key: true
      t.integer :wager
      t.integer :payout
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
