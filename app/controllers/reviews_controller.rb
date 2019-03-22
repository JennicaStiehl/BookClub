class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new
  end

  def create
    @book = Book.find(params[:book_id])
    rp = review_params
    rp[:user] = rp[:user].titleize
    @review = @book.reviews.create(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end



  private
  def review_params
    params.require(:review).permit(:title, :user, :rating, :description)
  end

end
