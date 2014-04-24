class AddPlusToFinances < ActiveRecord::Migration
  def change
    add_column :finances, :plus, :boolean
  end
end
