class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def user_deleted(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been deleted.')
  end

end


