class User < ApplicationRecord
    has_many :reviews
    has_many :ratings
  
    validates :name, :email, presence: true
  end
  