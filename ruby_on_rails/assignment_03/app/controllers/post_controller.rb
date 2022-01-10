class PostController < ApplicationController
  def index
    @posts = PostService.get_all_posts
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @posts = PostService.get_all_posts
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @posts = PostService.get_all_posts
    post = PostService.findby_id(params[:id])
    PostService.destroy_post(post)
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :public_flag)
  end
end
