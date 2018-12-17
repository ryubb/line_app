class UsersController < ApplicationController
  layout "top_application"

  before_action :logged_in_user, only: [:index, :show]
  before_action :correct_user, only: [:edit, :udpate, :destroy]

  def index
    @users = User.all
    render layout: "application"
  end

  def show
    @user = User.find(params[:id])
    @room_id = message_room_id(current_user, @user)
    @messages = Message.recent_in_room(@room_id)
    render layout: "application"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "登録に成功しました。"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find_by(id: params[:id])
      unless current_user == @user
        flash[:danger] = "アクセス権限がありません。"
        redirect_to current_user
      end
    end

    def message_room_id(first_user, second_user)
      first_id = first_user.id.to_i
      second_id = second_user.id.to_i
      if first_id < second_id
        "#{first_user.id}-#{second_user.id}"
      else
        "#{second_user.id}-#{first_user.id}"
      end
    end
end
