class ProductsController < ApplicationController

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])
  end

  def new
 	  @product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
      flash[:success] = "Product saved"
  		redirect_to @product
  	else
  		redirect_to new_product_path, notice: 'failed'
  	end

  end

  private

  def product_params
  	params.require(:product).permit(:title, :brand, :quantity)
  end

end
