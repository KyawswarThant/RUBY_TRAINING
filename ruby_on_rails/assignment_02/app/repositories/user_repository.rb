class UserRepository
  class << self
    # Retrieve all users from user table
    def get_all_users
      sql = "
        SELECT id, name, email, phone, address, birthday,
        CASE
          WHEN super_user_flag = 1 THEN 'super user'
          WHEN super_user_flag = 0 THEN 'normal user'
        End
        FROM users;
      "
      ActiveRecord::Base.connection.execute(sql)
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

    # Search user
    def search_user(query)
      sql = "
        SELECT id, name, email, phone, address, birthday,
        CASE
          WHEN super_user_flag = 1 THEN 'super user'
          WHEN super_user_flag = 0 THEN 'normal user'
        END As user_type
        FROM users
        where #{query};
      "
      ActiveRecord::Base.connection.execute(sql)
    end
  end
end
