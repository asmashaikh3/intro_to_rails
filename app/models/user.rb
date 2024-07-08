class User < ApplicationRecord
  has_many :reviews
  has_many :ratings

  has_secure_password

  validates :username, :email, presence: true
end