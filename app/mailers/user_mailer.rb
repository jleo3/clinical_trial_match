class UserMailer < ActionMailer::Base
  default from: "michaelwenger27@gmail.com"

  def new_match_alert
    @user = User.first
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'You Have New Match Emails')

  end
end
