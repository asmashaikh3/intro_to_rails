class BooksController < ApplicationController
  def index
    if params[:search].present?
      @books = Book.where("title LIKE ? OR author LIKE ? OR genre LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
                   .order(params[:sort])
                   .page(params[:page])
                   .per(10)
    else
      @books = Book.order(params[:sort])
                   .page(params[:page])
                   .per(10)
    end

    if @books.empty?
      flash.now[:notice] = 'No results found'
    end
  end

  def show
    @book = Book.find(params[:id])
    @ratings = @book.ratings
    @reviews = @book.reviews
  end
end
