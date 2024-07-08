class Book < ApplicationRecord
  has_many :book_genres
  has_many :genres, through: :book_genres

  has_many :ratings
  has_many :reviews
  belongs_to :user

  validates :title, :author, :genre, presence: true
end
