class Price < ApplicationRecord
	belongs_to :product
	belongs_to :shop
	validates_numericality_of :price, greater_than: 0, on: :create, message: 'invalid price'

	def last_update
		updated_at.to_formatted_s(:short)
	end
	
end