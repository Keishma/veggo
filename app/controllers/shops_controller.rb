class ShopsController < ApplicationController

    # define the index action
    def index

    end

    # define to new action, setting a new shop variable available for new page
    def new
        @shop = Shop.new
    end

    # on form sumission, we need a create action to create the new shop
    # defined the New shop variable, but have passed in shop_params
    def create
        @shop = Shop.new(shop_params)
        if @shop.save
            flash[:success] = "Shop created"
            redirect_to products_path
        elsif @shop.errors.any?
            error = @shop.errors.full_messages[0]
        redirect_to new_product_path
        flash[:danger] = error           
        end

    end

    #  Private methods can only be used within the class definition
    private

    # here we define the allowed parameters -strong parameters-  Action Controller parameters forbidden to be used in Active Model mass assignment
    def shop_params
        params.require(:shop).permit(:name)
    end

end
