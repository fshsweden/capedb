class Inflation < ActiveRecord::Base

	belongs_to :country

	#validates_presence_of :country_id, :on => "", :message => "Must enter a country"
	#validates_presence_of :year, :on => "", :message => "Must enter a year"
	#validates_presence_of :inflation, :on => "", :message => "Must enter an inflation figure"
end
