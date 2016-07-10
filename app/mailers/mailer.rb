class Mailer < ApplicationMailer

  def notify_profile_owner(hash, profile)
    @user = profile.user
    @profile = profile
    @details = hash
    mail(to: @user.email, subject: "Somebody has contacted you on CodeCore")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
