class BooksController < ApplicationController
  def index
    @books = Book.all

    if params[:search].present?
      @books = @books.where("title LIKE ? OR author LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    if params[:genre].present?
      @books = @books.where(genre: params[:genre])
    end

    if params[:sort].present?
      @books = @books.order(params[:sort])
    end

    @books = @books.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @ratings = @book.ratings
    @reviews = @book.reviews
  end
end
