class HomeController < ApplicationController
  layout "top_application"

  def index
    redirect_to current_user if logged_in?
  end

  def about
  end

  def contact
  end

  def friends
    @friends = current_user.friends
    render layout: "application"
  end
end
