class PostService
  class << self
    def get_all_posts
      PostRepository.get_all_posts
    end

    def find_by(field, value)
      PostRepository.find_by(field, value)
    end

    def update_post(post, params)
      PostRepository.update_post(post, params)
    end

    def destroy_post(post)
      PostRepository.destroy_post(post)
    end
  end
end
