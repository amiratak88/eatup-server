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
	end

	def update
		order = Order.find(params[:id])
		order.update(status: params[:status])
		scope = ""

		if params[:status] == "confirmed"
			scope = "manager"
			serialized_order = ActiveModelSerializers::SerializableResource.new(order, include: "**", scope: "user").to_json
			user = order.user
			UsersChannel.broadcast_to user, serialized_order
		elsif params[:status] == "finalized"
			scope = "user"
			serialized_order = ActiveModelSerializers::SerializableResource.new(order, include: "**", scope: "manager").to_json
			manager = order.restaurant.manager
			ManagersChannel.broadcast_to manager, serialized_order
		end

		render json: order, include: "**", scope: scope
	end

end
