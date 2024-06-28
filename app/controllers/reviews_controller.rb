class ReviewsController < ApplicationController
    def index
      @book = Book.find(params[:book_id])
      @reviews = @book.reviews
    end
  
    def show
      @book = Book.find(params[:book_id])
      @review = @book.reviews.find(params[:id])
    end
  
    def new
      @book = Book.find(params[:book_id])
      @review = @book.reviews.build
    end
  
    def create
      @book = Book.find(params[:book_id])
      @review = @book.reviews.build(review_params)
      if @review.save
        redirect_to book_reviews_path(@book)
      else
        render :new
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:content, :reviewer_name, :user_id)
    end
  end
  