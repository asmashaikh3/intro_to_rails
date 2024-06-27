class Review < ApplicationRecord
  belongs_to :book

  validates :content, :reviewer_name, presence: true
end