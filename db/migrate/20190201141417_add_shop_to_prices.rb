class AddShopToPrices < ActiveRecord::Migration[5.2]
  def change
    add_reference :prices, :shop, foreign_key: true
  end
end
