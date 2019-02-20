class Price < ApplicationRecord
	belongs_to :product
	belongs_to :shop

	def last_update
		updated_at.to_formatted_s(:short)
	end
	
end