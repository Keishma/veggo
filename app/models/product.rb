class Product < ApplicationRecord
	has_many :prices
	has_many :shops,  through:  :prices
	validates :title, :brand, :quantity, presence: true
	has_one_attached :image

	def full_title
		(brand + ' ' + title).split.map(&:capitalize)*' '
	end

	def self.search(search)
  		where("title LIKE ? OR brand LIKE ?", "%#{search}%", "%#{search}%")
	end

end
 