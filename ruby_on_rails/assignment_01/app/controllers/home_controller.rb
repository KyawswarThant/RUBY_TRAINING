class HomeController < ApplicationController
  def index
    @users = UserService.get_all_users
    @posts = PostService.get_all_posts
  end
end
