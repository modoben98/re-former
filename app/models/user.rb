class User < ApplicationRecord
  has_secure_password

  validates :username,
    presence: true,
    uniqueness: { case_sensitive: false}
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false},
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, 
    length: { minimum: 8 },
    format: { 
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[[:^alnum:]])/x,
      message: "must include at least one lowercase letter, one uppercase letter, one digit, and one special character"
    }
end
