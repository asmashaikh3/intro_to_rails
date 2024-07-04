# class Book < ApplicationRecord
#   has_many :reviews
#   has_many :ratings

#   validates :title, :author, :genre, :published_date, presence: true
# end

class Book < ApplicationRecord
    has_many :reviews
    has_many :ratings
  
    validates :title, :author, :genre, :published_date, presence: true
  end
  
