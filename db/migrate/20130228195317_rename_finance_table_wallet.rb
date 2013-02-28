class RenameFinanceTableWallet < ActiveRecord::Migration
	def change
		rename_column :finances, :table, :wallet_id
	end
end
