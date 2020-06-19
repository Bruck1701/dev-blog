class User < ApplicationRecord
  before_save { self.email = email.downcase}

  has_many :articles, dependent: :destroy


  validates :username, presence: true, 
                      uniqueness: { case_sensitive: false }, length: { minimum:3, maximum: 25 } 
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                      uniqueness: { case_sensitive: false }, length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }
  
  validates_presence_of :password_confirmation, if: :password_digest_changed?
  validates_confirmation_of :username, :password
  validates_confirmation_of :email,
                            message: 'Password should match confirmation'
  
has_secure_password
end