class Rating < ApplicationRecord
  belongs_to :book

  validates :score, presence: true, inclusion: { in: 1..5 }
end