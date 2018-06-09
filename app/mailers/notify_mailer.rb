class NotifyMailer < ApplicationMailer
  default from: 'notifications@fast-earth-84235.herokuapp.com'

  def notify_mail(user)
    @user = user
    @url  = 'https://fast-earth-84235.herokuapp.com'
    mail to: "#{@user.email}", subject: "ブログの作成完了メール"
  end
end
