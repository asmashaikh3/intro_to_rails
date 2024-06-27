class Book < ApplicationRecord
    has_many :ratings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :author, :genre, :published_date, presence: true
end
