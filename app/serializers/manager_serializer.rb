class ManagerSerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :username
	belongs_to :restaurant
	has_many :new_orders
	has_many :confirmed_orders

	def new_orders
		object.restaurant.orders.where(status: "finalized")
	end

	def confirmed_orders
		object.restaurant.orders.where(status: "confirmed")
	end
end
