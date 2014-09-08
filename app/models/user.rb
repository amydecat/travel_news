class User < ActiveRecord::Base
  validates :email, presence: true
  validates :password_digest, presence: true
  validates_uniqueness_of :email
  has_many :links
  has_many :comments
  has_many :votes


  has_secure_password
end
