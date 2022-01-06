class UserController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = UserService.findby_id(params[:id])
    @posts = UserService.get_all_users_posts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @save_user = UserService.save_user(@user)

    if @save_user
      flash[:notice] = "Created Account Successfully"
      redirect_to login_index_path
    else
      render :new
    end
  end

  def edit
    @user = UserService.findby_id(params[:id])
  end

  def update
    @user = UserService.findby_id(params[:id])
    @update_user = UserService.update_user(@user, user_params)
    if @update_user
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = UserService.findby_id(params[:id])
    UserService.destroy_user(user)

    redirect_to login_index_path
  end

  def handle_logout
    session.delete(:user_id)

    redirect_to login_index_path
  end

  # Search
  def handle_search
    fields = Array.new
    conditions = Array.new
    # Add fields into one array
    fields.push("name") unless params[:name] == ""
    fields.push("address") unless params[:address] == ""
    fields.push("super_user_flag") unless params[:user_type] == ""
    fields.push("email") unless params[:email] == ""
    fields.push("birthday") unless params[:birthday] == ""
    fields.push("phone") unless params[:phone] == ""

    # Combine field and value
    fields.each do |field|
      if field == "address"
        conditions.push(" #{field} LIKE '%#{params["#{field}"]}%' ")
      elsif field == "super_user_flag" && params[:user_type] == "super user"
        conditions.push(" #{field} = '1' ")
      elsif field == "super_user_flag" && params[:user_type] == "normal user"
        conditions.push(" #{field} = '0' ")
      else
        conditions.push(" #{field} = '#{params["#{field}"]}' ")
      end
    end

    # Make query for sql where statement
    query = conditions.join(" AND ")
    sql = "
      SELECT id, name, email, phone, address, birthday, 
      CASE
        WHEN super_user_flag = 1 THEN 'super user'
        WHEN super_user_flag = 0 THEN 'normal user'
      END AS super_user_flag
      FROM users
      where #{query}
    "
    @results = UserService.search_user(sql)

    render :index
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
  end
end
