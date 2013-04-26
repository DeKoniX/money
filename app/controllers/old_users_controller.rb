class OldUsersController < InheritedResources::Base
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: [:destroy, :index, :show]

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      @user.wallet.create!(name: "Wallet")
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    destroy! { users_url }
  end

  def edit
    @user = User.find(params[:id])
    @wallet = @user.wallet
  end

  def update
    if @user.update_attributes(params[:user])
      sign_in @user
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
