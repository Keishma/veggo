class Product < ApplicationRecord
	has_many :prices
	has_many :shops,  through:  :prices

	def full_title
		title
	end

end
