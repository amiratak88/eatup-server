class OrdersController < ApplicationController

	before_action :authorized_to_create, only: [:create]
	before_action :authorized_to_confirm, only: [:confirm]

	def index
		render json: Order.all, include: "**"
	end
	
	def show
		order = Order.find(params[:id])
		render json: order, include: "**"
	end

	def create
		@order = Order.new(user_id: @user_id, restaurant_id: params[:restaurant_id])
		if (@order.save)
			render json: @order, include: "**", scope: "user"
		else
			render json: { erros: @order.errors.full_messages }
		end
	end

	def confirm
		@order.update(status: "confirmed")
		broadcast_order_to_user
		render json: @order, include: "**", scope: "manager"
	end

	def finalize
		@order = Order.find(params[:id])
		@order.update(status: "finalized")
		broadcast_order_to_manager
		render json: @order, include: "**", scope: "user"
	end

	private

	def broadcast_order_to_user
		serialized_order = ActiveModelSerializers::SerializableResource.new(@order, include: "**", scope: "user").to_json
		user = @order.user
		UsersChannel.broadcast_to user, serialized_order
	end

	def broadcast_order_to_manager
		serialized_order = ActiveModelSerializers::SerializableResource.new(@order, include: "**", scope: "manager").to_json
		manager = @order.restaurant.manager
		ManagersChannel.broadcast_to manager, serialized_order
	end

	def authorized_to_create
		token = request.headers["Authorization"]
		begin
			payload = JWT.decode(token, ENV['SECRET_KEY'], true)
		rescue JWT::DecodeError
			render json: { error: "Invalid token" }
			return
		end
		@user_id = payload[0]["user_id"]
	end

	def authorized_to_confirm
		@order = Order.find(params[:id])
		token = request.headers["Authorization"]
		begin
			payload = JWT.decode(token, ENV['SECRET_KEY'], true)
		rescue JWT::DecodeError
			render json: { error: "Invalid token" }
			payload = [{}]
		end

		if payload[0]["manager_id"]
			manager = Manager.find(payload[0]["manager_id"])
			if manager != @order.restaurant.manager
				render json: { error: "This order is not for your restaurant"}
			end
		else
			render json: { error: "You must be a manager in order to confirm orders" }
		end
	end

end
