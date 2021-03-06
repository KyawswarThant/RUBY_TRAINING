class UserController < ApplicationController
  def index
    @users = UserService.get_all_users
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

    if @user.save
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
    session.delete(:user_id)
    flash[:notice] = "Your Account has been deleted!"
    redirect_to login_index_path
  end

  def handle_logout
    session.delete(:user_id)
    redirect_to login_index_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
  end
end
