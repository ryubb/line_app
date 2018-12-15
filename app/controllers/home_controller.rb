class HomeController < ApplicationController
  layout "top_application"

  def index
  end

  def about
  end

  def contact
  end

  def friends
    @user = User.find(60)
    render layout: "application"
  end
end
