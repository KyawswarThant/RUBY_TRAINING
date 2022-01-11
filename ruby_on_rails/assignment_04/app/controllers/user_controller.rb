class UserController < ApplicationController
  def index
    @users = UserService.get_all_users
    @login_user = UserService.find_by("email", session[:email])
  end

  def show
    @user = UserService.find_by("id", params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      if session[:email]
        @login_user = UserService.find_by("email", session[:email])
        UserMailer.with(user: @user, login_user: @login_user).information.deliver_later
        flash[:notice] = "Created Account Information are sent to your email"
        redirect_to user_index_path
      else
        flash[:notice] = "Account created successfully"
        redirect_to login_path
      end
    else
      render :new
    end
  end

  def edit
    @user = UserService.find_by("id", params[:id])
  end

  def update
    @user = UserService.find_by("id", params[:id])

    if UserService.update_user(@user, user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def handle_login
    @user = User.find_by(email: params[:email])

    if @user.present?
      if @user.authenticate(params[:password])
        session[:email] = @user.email
        redirect_to user_index_path
      else
        @error = "Incorrect Password"
        render :login
      end
    else
      @error = "Account with that email doesn't exist!"
      render :login
    end
  end

  def handle_logout
    session.delete(:email)
    redirect_to login_path
  end

  def destroy
    @login_user = UserService.find_by("email", session[:email])
    @user = UserService.find_by("id", params[:id])
    UserService.destroy_user(@user)

    if @login_user.id == @user.id
      session.delete(:email)
      redirect_to login_path
    else
      redirect_to user_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :super_user_flag, :address, :birthday, :phone)
  end
end
