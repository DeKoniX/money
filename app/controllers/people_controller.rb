class PeopleController < InheritedResources::Base
  before_filter :corrent_user, only: [:edit, :update, :destroy]

  def new
    @debts = Debt.new
    new!
  end

  def create
    create! { people_path }
    @person.user_id = current_user.id
    @person.save!
    @debt = Debt.new(params[:debt])
    @debt.person_id = @person.id
    @debt.save!
  end

  def update
    update! { people_path }
  end

  def destroy
    destroy! { people_path }
  end

  def permitted_params
      params.permit(:person => [:name, :user_id])
  end

  private
  def corrent_user
    if current_user.id != Person.find(params[:id]).user_id
      redirect_to root_url
    end
  end
end
