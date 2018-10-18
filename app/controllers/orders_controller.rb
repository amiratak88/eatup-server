class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
		render json: @order
	end
end
