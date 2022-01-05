class PasswordResetController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_later
    end

    flash[:notice] = "Password Reset link sent to your email"
    redirect_to root_path
  end

  def edit
    @user = User.find_signed(params[:token], purpose: "password reset")
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password reset")
    password = params[:user][:password]
    confirm_password = params[:user][:confirm_password]

    if password == confirm_password
      if @user.update(password: params[:user][:password])
        flash[:notice] = "Your password was reset successfully, please sign in"
        redirect_to login_index_path
      else
        render :edit
      end
    else
      @error = "Passwords didn't match!"

      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :confirm_password)
  end
end
