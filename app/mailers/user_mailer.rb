class UserMailer < ApplicationMailer
  default from: 'mohit@bluebash.co'
  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'New Album')
  end

  def destroy_mail
    @user = params[:user]
    mail(to: @user.email, subject: 'Deleted Site')
  end
  
  def new_user 
    @user= params[:user]
    mail(to: @user.email, subject: 'New User Created')
  end

end
