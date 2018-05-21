class NotifyMailer < ApplicationMailer
  default from: 'notifications@dummy.herokuapp.com'

  def notify_mail(user)
    @user = user
    @url  = 'https://dummy.herokuapp.com'
    mail to: "#{@user.email}", subject: "ブログの作成完了メール"
  end
end
