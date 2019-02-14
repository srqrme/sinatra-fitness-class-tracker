class User < ActiveRecord::Base
  has_many :fitness_classes
  has_secure_password

  PASSWORD_FORMAT = /\A
  (?=.{6,})          # Must contain 6 or more characters
  (?=.*\d)           # Must contain a digit
  (?=.*[a-z])        # Must contain a lower case character
/x

  validates :password, length: { minimum: 8 }, format: { with: PASSWORD_FORMAT }, allow_nil: true
end
