class DebtsController < InheritedResources::Base
  defaults :resource_class => Debt, :collection_name => 'debt', :instance_name => 'debts'
  before_filter :signed_in_user
  respond_to :js
  belongs_to :person


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
end
