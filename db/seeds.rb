require 'faker'

# Clear existing data
Book.destroy_all
User.destroy_all
Rating.destroy_all
Review.destroy_all

# Create users
10.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password"
  )
end

# Seed books with ratings and reviews
50.times do
  book = Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    published_date: Faker::Date.backward(days: 365 * 5) # Random date in the past 5 years
  )

  # Create ratings for each book
  rand(5..10).times do
    Rating.create!(
      score: rand(1..5),
      book: book
    )
  end

  # Create reviews for each book
  User.all.each do |user|
    Review.create!(
      content: Faker::Lorem.paragraph,
      reviewer_name: user.username,
      book: book,
      user: user
    )
  end
end

puts "Seeding done!"
