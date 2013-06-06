class FinancesController < InheritedResources::Base
  actions :edit, :new, :destroy, :create, :update, :index
  before_filter :signed_in_user
  respond_to :js

  def create
    @finance = current_user.finance.build(params[:finance])
    @finance.save
  end

  def update
    super do |format|
      format.html { redirect_to root_url }
    end
  end

  def index
    @wallets = current_user.wallet
  end

  private
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end
