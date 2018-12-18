class MessagesController < ApplicationController
  def create
    user = User.find_by(id: params[:to_user_id])
    current_user.send_message(params[:to_user_id], params[:room_id], params[:message][:content])
    flash[:success] = "メッセージを投稿しました。"
    redirect_to user
  end
end
