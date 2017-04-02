class UserNotifier < ActionMailer::Base
  default :from => 'parkmyboat@outlook.fr'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'PMB vous remercie de votre inscription' )
  end
end
