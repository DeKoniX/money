#encoding: utf-8
namespace :db do
  desc "Перенос данных из старой базы"
  task transfer_data: :environment do
    User.all.each do |user|
      tablecount = user.tablecount
      puts "Работаем с #{user.name}, над #{tablecount}"
      tablecount.times do |table|
        puts "№#{table+1}"
        wallet = user.wallet.create(:name => "Wallet #{table+1}")
        all_table = user.finance.find_all_by_table table+1
        all_table.each do |finance|
          puts "Finance id = #{finance.id}"
          finance.update_column(:wallet_id, wallet.id)
        end
      end
      user.update_column(:tablecount, 0)
    end
  end
end
