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

    def save_user(user)
      UserRepository.save_user(user)
    end

    def update_user(user, params)
      UserRepository.update_user(user, params)
    end

    def destroy_user(user)
      UserRepository.destroy_user(user)
    end

    def search_user(params)
      fields = Array.new
      conditions = Array.new
      # Add fields into array
      fields.push("name") unless params[:name] == ""
      fields.push("address") unless params[:address] == ""
      fields.push("super_user_flag") unless params[:user_type] == ""
      fields.push("email") unless params[:email] == ""
      fields.push("birthday") unless params[:birthday] == ""
      fields.push("phone") unless params[:phone] == ""

      # Combine field and value
      fields.each do |field|
        case field
        when "name" || "address"
          conditions.push(" #{field} LIKE '%#{params["#{field}"]}%' ")
        when "super_user_flag"
          if params[:user_type] == "super user"
            conditions.push(" #{field} = '1' ")
          else
            conditions.push(" #{field} = '0' ")
          end
        else
          conditions.push(" #{field} = '#{params["#{field}"]}' ")
        end
      end
      # Make query for sql where statement
      query = conditions.join(" AND ")

      UserRepository.search_user(query)
    end
  end
end
