class ProductsController < ApplicationController

  def index
  	@products = Product.all

    if params[:search]
      @products = Product.search(params[:search])
    end

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
    elsif @product.errors.any?
              error = @product.errors.full_messages[0]
          redirect_to new_product_path
          flash[:danger] = error
    end

  end
  

  private

  def product_params
  	params.require(:product).permit(:title, :brand, :quantity, :image)
  end

end
 