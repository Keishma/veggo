class PricesController < ApplicationController

  def new
 	  @price = Price.new
  end

  def create
  	@price = Price.new(price_params)
  	
  	if @price.save
  		@shop = params[:price][:shop_id]
  		
  		@product = params[:price][:product_id]

  		@old = Price.where(product_id: 1).where(shop_id: 1).last(2)[0]
  		@old.current = true
  		@old.save

  		flash[:success] = "Price saved - Shop:#{@shop} Product:#{@product}/ old price = #{@old.price}"
  		redirect_to @price

  	else
  		redirect_to new_price_path, notice: 'failed'
  	end

  end

  def show
  	@price = Price.where(product_id: 1).where(shop_id: 1).last
  end

  private

  def price_params
  	params.require(:price).permit(:product_id, :shop_id, :price)
  end

end
