class PricesController < ApplicationController

  def new
 	  @price = Price.new
  end

  def create
  	@price = Price.new(price_params)
      @shop = params[:price][:shop_id]
      @product = params[:price][:product_id]

  	if @price.save
      set_last
  		flash[:success] = "Price saved - id: #{@price.id} ||"
  		redirect_to @price
  	else
  		redirect_to new_price_path, notice: 'failed'
  	end

  end

  def set_last
    @p_id = @price.id
    return if @p_id.nil?
    @prices = Price.all
    that = Price.where(product_id: @price.product_id, shop_id: @price.shop_id).last(2)[0]
    prev_id = that.id
    old = Price.find(prev_id)
    price_off(old)
  end

  def putsy(block)
    puts " #{block}"
    puts "-------------------------"
  end

    def putsx(block)
    puts " xxx#{block}"
    puts "-------------------------"
  end

  def price_off(block)
      block.current = false
      block.save
  end

  def show
  	@price = Price.where(product_id: 1).where(shop_id: 1).last
  end

  private

  def price_params
  	params.require(:price).permit(:product_id, :shop_id, :price)
  end

end
