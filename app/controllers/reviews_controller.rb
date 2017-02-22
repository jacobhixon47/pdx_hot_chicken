class ReviewsController < ApplicationController
  def new
    if current_user.admin?
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

  def create
    if current_user.admin?
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
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

  def destroy
    if current_user.admin?
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      if @review.destroy
        flash[:notice] = 'Review was successfully deleted.'
        redirect_to product_path(@product)
      else
        flash[:alert] = 'Review could not be deleted. Please try again.'
        redirect_to product_path(@product)
      end
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end
end
