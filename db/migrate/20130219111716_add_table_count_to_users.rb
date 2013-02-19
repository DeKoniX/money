class AddTableCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tablecount, :integer, default: 1, limit: 10
  end
end
