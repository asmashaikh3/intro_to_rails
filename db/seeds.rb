require 'faker'

# Clear existing data
Review.destroy_all
Rating.destroy_all
Book.destroy_all
User.destroy_all

# Create users
users = 10.times.map do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
>>>>>>> 3f7713b (ahhh finally I fixed my broken code and I am back to where I was)
  )
end

# Create books
books = 20.times.map do
  Book.create(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    published_date: Faker::Date.between(from: 50.years.ago, to: Date.today)
  )
end
  # Create ratings for each book
  rand(5..10).times do
    Rating.create!(
      score: rand(1..5),
      review: Faker::Lorem.paragraph_by_chars(number: 50), # Ensures review is at least 50 characters long
      book: book,
      user: user
    )
  end
end

puts "Seeding done!"

