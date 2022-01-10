class PostService
  class << self
    def get_all_posts
      PostRepository.get_all_posts
    end

    def findby_id(id)
      PostRepository.findby_id(id)
    end

    def destroy_post(post)
      PostRepository.destroy_post(post)
    end
  end
end
