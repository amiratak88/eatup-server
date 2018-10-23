class OrderSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :restaurant_id
	# belongs_to :user
	# belongs_to :restaurant
	has_many :order_items
end