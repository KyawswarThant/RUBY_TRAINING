class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.information.subject
  #
  def information
    @user = params[:user]
    @login_user = params[:login_user]
    mail to: @login_user.email
  end
end
