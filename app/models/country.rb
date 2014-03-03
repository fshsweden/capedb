class Country < ActiveRecord::Base
  has_many :inflations
  has_many :products

  accepts_nested_attributes_for :products, :allow_destroy => true
end
