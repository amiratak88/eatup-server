class RestaurantsController < ApplicationController
	def orders
		render json: Restaurant.find(params[:id]).orders
	end
end