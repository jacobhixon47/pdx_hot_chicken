class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:notice] = "Your review was successfully posted!"
      redirect_to product_path(@product)
    else
      flash[:alert] = 'There was a problem adding your review. Please try again.'
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:notice] = 'Review was successfully deleted.'
      redirect_to product_path(@product)
    else
      flash[:alert] = 'Review could not be deleted. Please try again.'
      redirect_to product_path(@product)
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end
end
