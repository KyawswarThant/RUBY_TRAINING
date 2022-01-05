class UserRepository
  class << self
    # Retrieve all users from user table
    def get_all_users
      User.all
    end

    # Get all posts created by user
    def get_all_users_posts(user)
      user.posts.all
    end

    # Find user by id
    def findby_id(id)
      User.find(id)
    end

    # Find user by name
    def findby_name(name)
      User.find_by(name: name)
    end

    # Save user
    def save_user(user)
      user.save
    end

    # Update user
    def update_user(user, params)
      user.update(params)
    end

    # Destroy user
    def destroy_user(user)
      user.destroy
    end
  end
end
