class PostRepository
  class << self
    # Retrieve all posts from post table
    def get_all_posts
      Post.all
    end

    # Find post by id
    def findby_id(id)
      Post.find(id)
    end

    # Update Post
    def update_post(post, params)
      post.update(params)
    end

    #Destroy Post
    def destroy_post(post)
      post.destroy
    end
  end
end
