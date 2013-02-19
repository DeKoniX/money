class AddFinanceToTable < ActiveRecord::Migration
  def change
    add_column :finances, :table, :integer, default: 1, limit: 10
  end
end
