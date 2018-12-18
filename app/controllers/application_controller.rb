class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインが必要です。"
        redirect_to login_url
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
