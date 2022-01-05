class UserController < ApplicationController
  def show
    @user = UserService.findby_id(params[:id])
    @posts = UserService.get_all_users_posts(@user)
  end

  def new
    @user = UserService.new_user
  end

  def create
    @user = UserRepository.create_user(user_params)
    @save_user = UserService.save_user(@user)

    if @save_user
      redirect_to @user
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

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :super_user_flag, :phone, :address, :birthday)
  end
end
