class FinancesController < InheritedResources::Base
  before_filter :signed_in_user

  def create
    @finance = current_user.finance.build(params[:finance])
    if @finance.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    #@money = 0
    #current_user.finance.each do |fin|
      #@money += fin.m
    #end
    #user.finance.sum(:m, :conditions => "'finances'.'table' = '1'")
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end
