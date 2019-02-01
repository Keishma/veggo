class AddPriceToPrice < ActiveRecord::Migration[5.2]
  def change
    add_column :prices, :price, :decimal, precision: 8, scale: 2
  end
end
