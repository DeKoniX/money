class DebtsController < InheritedResources::Base
  defaults :resource_class => Debt, :collection_name => 'debt', :instance_name => 'debts'
  belongs_to :person

  before_filter :corrent_user

  def index
    @person = Person.find(params[:person_id])
    @debt = @person.debt.paginate(:page => params[:page])
  end

  def create
    create! { person_debts_path(@person) }
  end

  def update
    update! { person_debts_path(@person) }
  end

  def destroy
    destroy! { person_debts_path(@person) }
  end

  def permitted_params
      params.permit(:debt => [:desc, :m, :person_id])
  end

  private
  def corrent_user
    if current_user.id != Person.find(params[:person_id]).user_id
      redirect_to root_url
    end
  end
end
