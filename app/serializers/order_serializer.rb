class OrderSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :restaurant_id, :status, :updated_at
	belongs_to :user, if: -> {is_manager?}
	belongs_to :restaurant, if: -> {!is_manager?}
	has_many :order_items
end

def is_manager?
	scope == "manager"
end