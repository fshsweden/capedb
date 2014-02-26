class CapeController < ApplicationController
	def index

	end

	def update_cape_figures
		@products = Product.all
		for p in @products
			p.update_cape
		end
	end
end
