class PeopleController < InheritedResources::Base

	before_filter :corrent_user, only: [:edit, :update, :destroy]

	def create
		create! { people_path }
		@person.user_id = current_user.id
		@person.save!
	end
	def update
		update! { people_path }
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
