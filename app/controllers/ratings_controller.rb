class RatingsController < ApplicationController
    before_action :set_book
  
    def index
      @ratings = @book.ratings
    end
  
    def new
      @rating = @book.ratings.build
    end
  
    def create
      @rating = @book.ratings.build(rating_params)
      if @rating.save
        redirect_to book_path(@book), notice: 'Rating was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_book
      @book = Book.find(params[:book_id])
    end
  
    def rating_params
      params.require(:rating).permit(:score)
    end
  end
  