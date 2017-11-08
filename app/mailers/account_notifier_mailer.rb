class AccountNotifierMailer < ApplicationMailer
  default from: "no-reply@student_tracker.io"
  layout 'mailer'

  def inform(user, password)
    @user = user
    @password = password
    mail(to: user.email, subject: "Account created at Student Tracker")
  end
end
