class PricesController < ApplicationController

  def new
      product_id = params[:id]

      @price = Price.new(product_id: product_id)
      
      if(params.has_key?(:id))
        putsx "here"
        putsx product_id
        @product = Product.find(params[:id])
      else
        @product = false
      end

  end

  def create
  	@price = Price.new(price_params)
      @shop = params[:price][:shop_id]
      @product = params[:price][:product_id]

  	if @price.save
      set_last
  		flash[:success] = "Price saved - id: #{@price.id} ||"
  		redirect_to @price
  	elsif @price.errors.any?
              error = @price.errors.full_messages[0]
  		    redirect_to new_price_path, notice: error
  	end

  end

  def set_last
    price_id = @price.id
    return if price_id.nil?
      @prices = Price.all
      past_price = Price.where(product_id: @price.product_id, shop_id: @price.shop_id).last(2)[0]
      prev_id = past_price.id
      old_price = Price.find(prev_id)

      price_off(price_id,old_price)
  end

  def putsy(block)
    puts " #{block}"
    puts "-------------------------"
  end

  def putsx(block)
    puts " xxx#{block}"
    puts "-------------------------"
  end

  def price_off(new_price,old_price)
      return if new_price === old_price.id
        old_price.current = false
        old_price.save
  end

  def show
  	@price = Price.where(product_id: 1).where(shop_id: 1).last
  end

  private

  def price_params
  	params.require(:price).permit(:product_id, :shop_id, :price)
  end

end
