class OrdersController < ApplicationController
	
	def index
		render json: Order.all, include: "**"
	end
	
	def show
		order = Order.find(params[:id])
		render json: order, include: "**"
	end

	def create

		token = request.headers["Authorization"]
		begin
			payload = JWT.decode(token, ENV['SECRET_KEY'], true)
		rescue JWT::DecodeError
			nil
		end
		if (payload)
			user_id = payload[0]["user_id"]
			@order = Order.create(user_id: user_id, restaurant_id: params[:restaurant_id])
			render json: @order, include: "**"
		else
			render json: { error: "Invalid token" }
		end

		# restaurant = Restaurant.find(params[:restaurant_id])
		# manager = restaurant.manager
		# order = restaurant.orders.create(user_id: params[:user_id])

		# serialized_order = ActiveModelSerializers::Adapter::Json.new(
		# 	OrderSerializer.new(order)
		# ).serializable_hash

		# ManagersChannel.broadcast_to manager, serialized_order

		# render json: order
	end

	def update
		@order = Order.find(params[:id])
		@order.update(status: params[:status])
		render json: @order, include: "**"
	end

end
