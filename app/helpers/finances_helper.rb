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
    summ = 0
    wallet.finance.each do |f|
      if f.plus == true
        summ += f.m
      elsif f.plus == false
        summ -= f.m
      end
    end
    return summ
  end

  def finplus(wallet)
    wallet.finance.each do |f|
      if f.plus == true
        return true
      end
    end
    return false
  end

  def finminus(wallet)
    wallet.finance.each do |f|
      if f.plus == false
        return true
      end
    end
    return false
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
