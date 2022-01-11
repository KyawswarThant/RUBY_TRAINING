class UserService
  class << self
    def get_all_users
      UserRepository.get_all_users
    end

    def find_by(field, value)
      UserRepository.find_by(field, value)
    end

    def update_user(user, params)
      UserRepository.update_user(user, params)
    end

    def destroy_user(user)
      UserRepository.destroy_user(user)
    end
  end
end
