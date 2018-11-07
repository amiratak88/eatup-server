class OrderItemsController < ApplicationController
	def create
		@order_item = OrderItem.create(order_id: params[:order_id], item_id: params[:item_id])
		render json: @order_item, include: "**"
	end

	def destroy
		@order_item = OrderItem.find_by(order_id: params[:order_id], item_id: params[:item_id])
		OrderItem.destroy(@order_item.id)
		render json: @order_item, include: "**"
	end
end
