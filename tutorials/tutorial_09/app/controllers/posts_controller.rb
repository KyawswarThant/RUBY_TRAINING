class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    author = User.find((params[:post])[:user_id])
    @post = author.posts.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user_id = params[:user_id]
  end

  def update
    @post = Post.finde(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    user_id = params[:user_id]
    post.destroy

    redirect_to user_path({ "id": user_id })
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :public_flag)
  end
end
