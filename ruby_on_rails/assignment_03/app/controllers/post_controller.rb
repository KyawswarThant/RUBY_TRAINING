class PostController < ApplicationController
  def index
    @posts = PostService.get_all_posts
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to post_index_url }
        format.json { head :no_content }
        format.js { render :layout => false }
      end
    end
  end

  def destroy
    post = PostService.findby_id(params[:id])
    PostService.destroy_post(post)
    respond_to do |format|
      format.html { redirect_to post_index_url, notice: "Post was successfully destroyed" }
      format.json { head :no_content }
      format.js { render :layout => false }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :public_flag)
  end
end
