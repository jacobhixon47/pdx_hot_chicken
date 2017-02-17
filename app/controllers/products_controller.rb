class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to :controller => 'home'
    else
      flash[:alert] = 'There was a problem adding your product. Please try again.'
      render :new
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end
