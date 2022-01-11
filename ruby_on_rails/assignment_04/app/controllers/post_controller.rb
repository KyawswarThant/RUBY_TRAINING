class PostController < ApplicationController
  def index
    user = UserService.find_by("email", session[:email])
    @posts = user.posts.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = PostService.find_by("id", params[:id])
  end

  def create
    user = UserService.find_by("email", session[:email])
    @post = user.posts.new(post_params)

    if @post.save
      redirect_to post_index_path
    else
      render :new
    end
  end

  def edit
    @post = PostService.find_by("id", params[:id])
  end

  def update
    @post = PostService.find_by("id", params[:id])

    if PostService.update_post(@post, post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = PostService.find_by("id", params[:id])
    PostService.destroy_post(@post)
    redirect_to post_index_path
  end

  def get_posts
    @user = UserService.find_by("email", session[:email])
    @posts = @user.posts.all
    @posts_info = Array.new
    @posts.each do |post|
      @posts_info.push([post.title, post.description])
    end
    PostMailer.with(posts: @posts_info, user: @user).information.deliver_later
    flash[:notice] = "All of your posts information are sent to your email"
    redirect_to post_index_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :public_flag)
  end
end
