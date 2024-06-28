class ReviewsController < ApplicationController
    before_action :set_book
  
    def index
      @reviews = @book.reviews
    end
  
    def new
      @review = @book.reviews.build
    end
  
    def create
      @review = @book.reviews.build(review_params)
      @review.reviewer_name = current_user.username if user_signed_in?
      if @review.save
        redirect_to book_reviews_path(@book)
      else
        render :new
      end
    end
  
    private
  
    def set_book
      @book = Book.find(params[:book_id])
    end
  
    def review_params
      params.require(:review).permit(:content, :reviewer_name, :user_id)
    end
  end
  