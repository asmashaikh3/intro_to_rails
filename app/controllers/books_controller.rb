class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = Book.where("title LIKE ? OR author LIKE ? OR genre LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
    @ratings = @book.ratings
    @reviews = @book.reviews
  end
end
