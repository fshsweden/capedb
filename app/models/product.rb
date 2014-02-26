class Product < ActiveRecord::Base
	
	has_many :prices
	belongs_to :country
	
	accepts_nested_attributes_for :prices, :allow_destroy => true

	def update_cape

	end
end
