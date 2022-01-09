class PostController < ApplicationController
  def index
    @posts = PostService.get_all_posts
  end

  def show
    @post = PostService.findby_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    author = UserService.findby_id(session[:user_id])
    @post = author.posts.new(post_params)

    if @post.save
      redirect_to post_index_path
    else
      render :new
    end
  end

  def edit
    @post = PostService.findby_id(params[:id])
  end

  def update
    @post = PostService.findby_id(params[:id])
    @update_post = PostService.update_post(@post, post_params)
    if @update_post
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    post = PostService.findby_id(params[:id])
    PostService.destroy_post(post)
    redirect_to post_index_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :public_flag)
  end
end
