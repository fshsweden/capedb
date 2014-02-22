class Country < ActiveRecord::Base
	belongs_to :product
	has_many :inflations
end
