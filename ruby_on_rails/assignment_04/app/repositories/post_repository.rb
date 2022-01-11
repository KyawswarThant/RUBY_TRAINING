class PostRepository
  class << self
    def get_all_posts
      Post.all
    end

    def find_by(field, value)
      Post.find_by("#{field}": value)
    end

    def update_post(post, params)
      post.update(params)
    end

    def destroy_post(post)
      post.destroy
    end
  end
end
