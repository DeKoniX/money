class FinancesController < InheritedResources::Base
  actions :edit, :new, :destroy, :create, :update, :index
  before_filter :signed_in_user

  def create
    @finance = current_user.finance.build(params[:finance])
    @finance.plus = params[:plus]
    if @finance.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def new
    new!
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
      redirect_to signin_url, notice: "Вам необходимо войти в систему или зарегистрироваться."
    end
  end
end
