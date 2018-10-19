class OrdersController < ApplicationController
	def show
		order = Order.find(params[:id])
		render json: order
	end

	def create
		restaurant = Restaurant.find(params[:restaurant_id])
		manager = restaurant.manager
		order = restaurant.orders.create(user_id: params[:user_id])

		serialized_order = ActiveModelSerializers::Adapter::Json.new(
			OrderSerializer.new(order)
		).serializable_hash

		ManagersChannel.broadcast_to manager, serialized_order

		render json: order
	end

end
