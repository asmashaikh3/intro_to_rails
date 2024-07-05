class BooksController < ApplicationController
  def index
    @books = if params[:search].present?
               Book.where("title LIKE ? OR author LIKE ? OR genre LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
                   .order(params[:sort])
                   .page(params[:page])
                   .per(6)
             elsif params[:genre].present?
               Book.where(genre: params[:genre])
                   .order(params[:sort])
                   .page(params[:page])
                   .per(6)
             else
               Book.order(params[:sort])
                   .page(params[:page])
                   .per(6)
             end
  end

  def show
    @book = Book.find(params[:id])
    @ratings = @book.ratings
    @reviews = @book.reviews
  end
end
