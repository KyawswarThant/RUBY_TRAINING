class UserService
  class << self
    def get_all_users
      UserRepository.get_all_users
    end

    def get_all_users_posts(user)
      UserRepository.get_all_users_posts(user)
    end

    def findby_id(id)
      UserRepository.findby_id(id)
    end

    def findby_name(name)
      UserRepository.findby_name(name)
    end

    def update_user(user, params)
      UserRepository.update_user(user, params)
    end

    def destroy_user(user)
      UserRepository.destroy_user(user)
    end
  end
end
