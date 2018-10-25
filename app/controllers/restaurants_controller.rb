class RestaurantsController < ApplicationController
	def orders
		render json: Restaurant.find(params[:id]).orders
	end

	def search
		@restaurants = Restaurant.all.select do |r|
			r.name.downcase.include?(params[:term].downcase)
		end
		render json: @restaurants, include: "**"
		# render json: Restaurant.where(name: params[:term]), include: "**"
	end
end