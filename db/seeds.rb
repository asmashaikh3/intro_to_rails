require 'faker'

# Clear existing data
Book.destroy_all
User.destroy_all
Rating.destroy_all

# Create users
users = 10.times.map do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
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

# Create ratings
books.each do |book|
  users.sample(5).each do |user|
    Rating.create(
      score: rand(1..5),
      review: Faker::Lorem.paragraph_by_chars(number: 50), # Ensures review is at least 50 characters long
      book: book,
      user: user
    )
  end
end
