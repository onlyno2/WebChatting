class User < ApplicationRecord
  has_many :posts
  has_many :likes

  validates_presence_of :name, :email, :password_digest
  validates_format_of :email,
                      with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password
end
