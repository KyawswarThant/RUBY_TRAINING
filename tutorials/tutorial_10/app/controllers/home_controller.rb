class HomeController < ApplicationController
  def index
    if session[:user_id]
      @user = UserService.findby_id(session[:user_id])
      @posts = UserService.get_all_users_posts(@user)
    end
  end
end
