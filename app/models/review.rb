class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :content, :reviewer_name, presence: true
end
