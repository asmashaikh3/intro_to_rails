require 'faker'

# Clear existing data
Book.destroy_all
User.destroy_all
Rating.destroy_all
Review.destroy_all
Genre.destroy_all
Role.destroy_all
BookGenre.destroy_all
UserRole.destroy_all

# Create genres
genres = %w[Fiction Non-Fiction Mystery Fantasy Biography Science].map do |genre|
  Genre.create!(name: genre)
end

# Create roles
roles = %w[Admin Member Guest].map do |role|
  Role.create!(name: role)
end

# Create users
users = 10.times.map do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: "password"
  )
end

# Create books with ratings and reviews
50.times do
  book = Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    published_date: Faker::Date.backward(days: 365 * 5) # Random date in the past 5 years
  )

  # Assign genres to the book
  book.genres << genres.sample(rand(1..3))

  # Create ratings for each book
  rand(5..10).times do
    Rating.create!(
      score: rand(1..5),
      book: book,
      user: users.sample
    )
  end

  # Create reviews for each book
  users.each do |user|
    Review.create!(
      content: Faker::Lorem.paragraph,
      reviewer_name: user.username,
      book: book,
      user: user
    )
  end
end

# Assign roles to users
users.each do |user|
  user.roles << roles.sample(rand(1..3))
end

puts "Seeding done!"
