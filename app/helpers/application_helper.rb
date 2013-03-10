module ApplicationHelper
  def sumDebts
    current_user.debt.sum(:m)
  end
  def sumFinances
    current_user.finance.sum(:m)
  end
end
