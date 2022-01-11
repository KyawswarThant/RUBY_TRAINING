class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.information.subject
  #
  def information
    @posts = params[:posts_info]
    @user = params[:user]
    mail to: @user.email
  end
end
