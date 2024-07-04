# class Rating < ApplicationRecord
#   belongs_to :book

#   validates :score, presence: true, inclusion: { in: 1..5 }
# end

class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :score, presence: true
end
