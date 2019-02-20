class PricesController < ApplicationController

  def new
 	  @price = Price.new
  end

  def create
  	@price = Price.new(price_params)
  	
  	if @price.save
  		flash[:success] = "Price saved"
  		redirect_to @price
  		#@old_price = Price.last(2)[0].current

  	else
  		redirect_to new_price_path, notice: 'failed'
  	end

  end

  def show
  	
  end

  private

  def price_params
  	params.require(:price).permit(:product_id, :shop_id, :price)
  end

end
