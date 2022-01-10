class PostRepository
  class << self
    def get_all_posts
      Post.all
    end

    def findby_id(id)
      Post.find(id)
    end

    def destroy_post(post)
      post.destroy
    end
  end
end
