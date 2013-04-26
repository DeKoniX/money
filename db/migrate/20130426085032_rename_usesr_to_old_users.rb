class RenameUsesrToOldUsers < ActiveRecord::Migration
  def change
    remove_index :users, :name => 'index_users_on_email'
    remove_index :users, :name => 'index_users_on_remember_token'
    rename_table :users, :old_users
  end
end
