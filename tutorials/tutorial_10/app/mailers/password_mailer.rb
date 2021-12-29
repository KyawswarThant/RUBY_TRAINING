class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    user = params[:user]
    @token = user.signed_id(expires_in: 15.minutes, purpose: "password reset")
    mail to: user.email
  end
end
