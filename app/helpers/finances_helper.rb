module FinancesHelper
  def currentTable(table)
    current_user.finance.find_all_by_table(table)
  end

  def countTable
    current_user.tablecount
  end

  def sumTable(table)
    money = 0
    currentTable(table).each do |cur|
      money += cur.m
    end
    money
    #current_user.finance.sum(:m, :conditions => "'table' = '#{table}'")
  end
end
