class WalletsController < InheritedResources::Base
  defaults :resource_class => Wallet, :collection_name => 'wallet', :instance_name => 'wallets'
  actions :edit, :new, :destroy, :create, :update
  belongs_to :user

  def create
    create! { edit_user_path(@user) }
  end

  def update
    update! { edit_user_path(@user) }
  end

  def destroy
    destroy! { edit_user_path(@user) }
  end

  def permitted_params
      params.permit(:wallet => [:name])
  end
end
