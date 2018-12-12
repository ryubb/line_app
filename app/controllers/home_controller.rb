class HomeController < ApplicationController
  layout "top_application"

  def index
  end

  def about
  end

  def contact
  end

  def timeline
    render layout: "application"
  end
end
