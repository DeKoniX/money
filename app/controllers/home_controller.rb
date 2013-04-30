class HomeController < ApplicationController
  def index
    if signed_in?
      redirect_to finances_path
    end
  end
end
