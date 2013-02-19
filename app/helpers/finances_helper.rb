module FinancesHelper
  def currentTable(table)
    current_user.finance.find_all_by_table(table)
  end

  def countTable
    current_user.finance.maximum("table")
  end
end
