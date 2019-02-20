class AddCurrentToPrices < ActiveRecord::Migration[5.2]
  def change
  	add_column :prices, :current, :boolean, default: true
  end
end
