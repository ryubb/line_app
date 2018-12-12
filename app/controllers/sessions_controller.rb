class SessionsController < ApplicationController
  layout "top_application"
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "ログインしました。"
      redirect_to user
    else
      flash[:danger] = "ログインに失敗しました。"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
