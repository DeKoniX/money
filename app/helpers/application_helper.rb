module ApplicationHelper

  def sumDebts
    current_user.debt.sum(:m)
  end

  def sumFinances
    summ = 0
    current_user.finance.each do |f|
      if f.plus == true
        summ += f.m
      elsif f.plus == false
        summ -= f.m
      end
    end
    return summ
  end

end
