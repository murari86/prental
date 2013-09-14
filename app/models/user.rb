class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ActiveRecord::Base
  has_many :properties

  validates :email, presence: true, uniqueness: true, email: true
  validates :password, presence: true, length: { minimum: 4 }
  validates_confirmation_of :password 
  validates :phone_no, presence: true, length: { minimum: 10 }

  attr_accessible :password_confirmation, :user_id
  attr_accessible :password, :email, :first_name, :last_name, :phone_no, :role
  before_create :check_password_confirmation
  has_many :properties

  def self.authenticate(email, password)
    @user = User.where(:email => email, :password => password).first
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
