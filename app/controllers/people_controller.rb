class PeopleController < InheritedResources::Base
  before_filter :corrent_user, only: [:edit, :destroy]
  respond_to :js

  def new
    @debts = Debt.new
    new!
  end

  def create
    @person = Person.new(params[:person])
    @person.user_id = current_user.id
    @person.save!
    @debt = Debt.new(params[:debt])
    @debt.person_id = @person.id
    @debt.save!
    super do |format|
      format.html { redirect_to people_path }
      format.js
    end
  end

  def destroy
    destroy! { people_path }
  end

  private
  def corrent_user
    if current_user.id != Person.find(params[:id]).user_id
      redirect_to root_url
    end
  end
end
