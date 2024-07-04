class BooksController < ApplicationController
  def index
    @books = if params[:search]
               Book.where('title LIKE ?', "%#{params[:search]}%")
             else
               Book.all
             end
  end

  def show
    @book = Book.find(params[:id])
    @ratings = @book.ratings
    @reviews = @book.reviews
  end
end
