class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :score, presence: true
  validates :review, length: { minimum: 10 }, allow_blank: true
end
