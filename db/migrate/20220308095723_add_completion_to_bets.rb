class AddCompletionToBets < ActiveRecord::Migration[6.1]
  def change
    add_column :bets, :completion, :boolean
  end
end
