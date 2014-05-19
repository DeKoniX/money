class FinancesController < InheritedResources::Base
  actions :edit, :new, :destroy, :create, :update, :index
  before_filter :signed_in_user
  respond_to :js

  def create
    @finance = current_user.finance.build(params[:finance])
    @finance.plus = params[:plus]
    respond_to do |format|
      if @finance.save
        format.html { redirect_to root_url }
        format.json { render json: @finance, status: :created, location: @finance}
        format.js
        #redirect_to root_url
      else
        format.html { render action: "index" }
        format.json { render json: @finance.errors, status: :unprocessable_entity }
        format.js { render action: "new" }
        # render 'new'
      end
    end
  end

  # def new
    # new!
  # end

  def update
    super do |format|
      if @finance.save
        format.html { redirect_to root_url }
      else
        format.js { render action: "edit" }
      end
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
