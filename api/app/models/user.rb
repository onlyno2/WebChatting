class User < ApplicationRecord
  has_many :posts
  validates_presence_of :name, :email, :password_digest

  has_secure_password
end
