class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable        
  has_many :albums 
  after_create :Send_mail
  
  private
  def Send_mail
    UserMailer.with(user: self).welcome_email.deliver_now
  end


end
