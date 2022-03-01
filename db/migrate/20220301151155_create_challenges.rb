class CreateChallenges < ActiveRecord::Migration[6.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.integer :odds

      t.timestamps
    end
  end
end
