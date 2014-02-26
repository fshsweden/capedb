class Country < ActiveRecord::Base
	has_many :inflations
	has_many :products
end
