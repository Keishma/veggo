class Product < ApplicationRecord
	has_many :prices
	has_many :shops,  through:  :prices

	def full_title
		(brand + ' ' + title).split.map(&:capitalize)*' '
	end

end
