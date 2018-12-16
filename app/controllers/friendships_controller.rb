class FriendshipsController < ApplicationController
  before_action :logged_in_user

  def create
    user = User.find(params[:to_user_id])
    current_user.become_friend(user)
    flash[:success] = "#{user.name}さんと友達になりました。"
    redirect_to users_path
  end
end
