# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Clear existing data
Book.destroy_all
Rating.destroy_all
Review.destroy_all

# Create books
50.times do
  book = Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    published_date: Faker::Date.backward(days: 365 * 5) # Random date in the past 5 years
  )

  # Create ratings for each book
  rand(5..10).times do
    Rating.create(
      score: rand(1..5),
      book: book
    )
  end

  # Create reviews for each book
  rand(2..5).times do
    Review.create(
      content: Faker::Lorem.paragraph(sentence_count: 5),
      reviewer_name: Faker::Name.name,
      book: book
    )
  end
end

puts "Seeding done!"
