class LoginController < ApplicationController
  def handle_login
    user = User.find_by(name: params[:username], password: params[:password])

    if user.present?
      flash[:notice] = "Login Success"
      redirect_to login_index_path
    else
      @error = "Username or Password Incorrect"
      render :index
    end
  end
end
