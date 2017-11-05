# Preview all emails at http://localhost:3000/rails/mailers/account_notifier
class AccountNotifierPreview < ActionMailer::Preview
  def inform_preview
    AccountNotifier.inform(User.first)
  end
end
