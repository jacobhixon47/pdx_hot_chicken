class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    if current_user.admin?
      @product = Product.new
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

  def create
    if current_user.admin?
      @product = Product.new(product_params)
      if @product.save
        flash[:notice] = "Product successfully added!"
        redirect_to products_path
      else
        flash[:alert] = 'There was a problem adding your product. Please try again.'
        render :new
      end
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

  def edit
    if current_user.admin?
      @product = Product.find(params[:id])
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

  def update
    if current_user.admin?
      @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:notice] = "Product successfully updated!"
        redirect_to product_path(@product)
      else
        flash[:alert] = "There was a problem updating this product. Please try again."
        render :edit
      end
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

  def destroy
    if current_user.admin?
      @product = Product.find(params[:id])
      if @product.destroy
        @product.reviews.each do |review|
          review.destroy
        end
        redirect_to products_path
      else
        render :show
      end
    else
      flash[:alert] = "Oops! You don't have the credentials for that."
      redirect_to products_path
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :image, :price)
  end
end
