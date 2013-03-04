module FinancesHelper
  #def currentTablePag(table)
    ##current_user.finance.find_all_by_table(table).paginate(:page, params[:page])
    #current_user.finance.where(:table => table).paginate(:page => params[:page], :order => "updated_at DESC", :per_page => 15)
  #end

  #def currentTable(table)
    ##current_user.finance.find_all_by_table(table).paginate(:page, params[:page])
    #current_user.finance.where(:table => table)
  #end

  def current_finance(wallet)
    @finance = wallet.finance.paginate(:page => params[:"page_#{wallet.id}"], :order => "updated_at DESC", :per_page => 15)
    #@finance = wallet.finance
  end

  def sumTable(wallet)
    wallet.finance.sum(:m)
  end

  # def countTable
  #   current_user.tablecount
  # end

  # def sumTable(table)
  #   money = 0
  #   currentTable(table).each do |cur|
  #     money += cur.m
  #   end
  #   money
  #   #current_user.finance.sum(:m, :conditions => "'table' = '#{table}'")
  # end
end
