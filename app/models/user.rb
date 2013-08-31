class User < ActiveRecord::Base

  validates :email, uniqueness: true
  validates_confirmation_of :password 
  attr_accessible :password_confirmation, :user_id
  attr_accessible :password, :email, :first_name, :last_name, :phone_no
  before_create :check_password_confirmation
  has_many :properties

  def self.authenticate(email, password)
    @user = User.where(email: email, password: password).first
    if @user
      @user
    else
      nil
    end
  end
  
  private
  def check_password_confirmation
    unless self.password == self.password_confirmation
      self.errors.add(:password, 'please enter correct passoword_confirmation')
    end
  end

end
