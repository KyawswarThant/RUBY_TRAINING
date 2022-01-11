class UserRepository
  class << self
    def get_all_users
      User.all
    end

    def find_by(field, value)
      User.find_by("#{field}": value)
    end

    def update_user(user, params)
      user.update(params)
    end

    def destroy_user(user)
      user.destroy
    end
  end
end
