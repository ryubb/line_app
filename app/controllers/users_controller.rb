class UsersController < ApplicationController
  layout "top_application"

  def index
    @user = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "登録に成功しました。"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
