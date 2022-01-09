class HomeController < ApplicationController
  def index
    if session[:user_id]
      @user = UserService.findby_id(session[:user_id])
      @posts = @user.posts.all
    end
  end
end
