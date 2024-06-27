# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Book Reviews Application

## Data Sources
The application uses the following datasets:
- **Books**: Contains information about books, including title, author, genre, and published date.
- **Ratings**: Contains ratings for books, with a score associated with a book.
- **Reviews**: Contains reviews for books, with content and reviewer name associated with a book.

## Database Tables
- **Books**: `title`, `author`, `genre`, `published_date`
- **Ratings**: `score`, `book_id`
- **Reviews**: `content`, `reviewer_name`, `book_id`
