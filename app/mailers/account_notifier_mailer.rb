class AccountNotifierMailer < ApplicationMailer
  default from: "no-reply@student_tracker.io"
  layout 'mailer'

  def inform(user)
    @user = user
    mail(to: user.email, subject: "Account created at Student Tracker")
  end
end
