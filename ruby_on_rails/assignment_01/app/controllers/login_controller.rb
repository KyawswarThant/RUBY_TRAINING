class LoginController < ApplicationController
  def handle_login
    user = UserService.findby_name(params[:username])

    if user.present?
      if user.authenticate(params[:password])
        flash[:notice] = "Login Success"
        redirect_to login_index_path
      else
        @error = "Wrong Password"

        render :index
      end
    else
      @error = "Username doesn't exist"

      render :index
    end
  end
end