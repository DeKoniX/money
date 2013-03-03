class AddWalletIdToFinances < ActiveRecord::Migration
  def change
    add_column :finances, :wallet_id, :integer
  end
end
