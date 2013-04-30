class WalletsController < InheritedResources::Base
  defaults :resource_class => Wallet, :collection_name => 'wallet', :instance_name => 'wallets'
  actions :edit, :new, :destroy, :create, :update
  belongs_to :user
  def create
    create! { root_path }
  end
  def update
    update! { root_path }
  end
  def destroy
    destroy! { root_path }
  end
  #def create
    #@user = User.find(params[:user_id])
    #@wallet = @user.wallet.new(params[:wallet])
    #@wallet.save
    #redirect_to edit_user_path_path(@user)
  #end

  #def new
    #@user = User.find(params[:user_id])
    #@wallet = @user.wallet.new
  #end

  #def index
    #@wallets = current_user.wallet
  #end
end
