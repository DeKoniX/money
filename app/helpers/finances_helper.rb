module FinancesHelper
  def currentTable(table)
    current_user.finance.find_all_by_table(table)
  end

  def countTable
    current_user.tablecount
  end

  def sumTable(table)
    current_user.finance.sum(:m, :conditions => "'finances'.'table' = '#{table}'")
  end
end
