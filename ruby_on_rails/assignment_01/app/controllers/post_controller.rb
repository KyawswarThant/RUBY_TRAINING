require "csv"

class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = PostService.findby_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    author = User.find((params[:post])[:user_id])
    @post = author.posts.new(post_params)

    if @post.save
      redirect_to @post
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

  # Download format CSV
  def handle_format_download
    redirect_to "/Post_CSV_Format.csv"
  end

  # Download all posts in csv format
  def handle_data_download
    posts = PostService.get_all_posts

    CSV.open(Rails.root.join("public/posts.csv"), "wb") do |csv|
      csv << ["Title", "Description", "Public Flag"]
      posts.each do |post|
        csv << [post.title, post.description, post.public_flag]
      end
    end
    redirect_to "/posts.csv"
  end

  # Handle uploaded CSV
  def handle_upload_csv
    if params[:csv]
      data = CSV.parse(File.read(params[:csv]), headers: true)
      user = User.find(session[:user_id])

      data.length.times do |num|
        unless data[num]["Title"] == nil && data[num]["Description"] == nil && data[num]["Public Flag"] == nil
          user.posts.create(title: data[num]["Title"], description: data[num]["Description"], public_flag: data[num]["Public Flag"])
        end
      end
      redirect_to user_index_path
    else
      redirect_to user_index_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :public_flag)
  end
end
