class TimelinesController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :destroy]

  def index
    @timelines = Timeline.all
  end

  def create
    tl = current_user.timelines.create(params_tls)
    if tl.save
      flash[:success] = "投稿に成功しました。"
      redirect_to timelines_path
    else
      flash[:danger] = "何か入力してください"
      render "index"
    end
  end

  def destroy
    flash[:success] = "投稿を削除しました。"
    Timeline.find_by(id: params[:id]).delete
    redirect_to timelines_path
  end

  private
    def params_tls
      params.require(:tl).permit(:content)
    end
end
