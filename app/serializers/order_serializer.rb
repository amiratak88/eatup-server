class OrderSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :status, :updated_at
	attribute :restaurant_id, if: -> {!is_manager?}
	attribute :user_id, if: -> {!is_manager?}
	belongs_to :user, if: -> {is_manager?}
	belongs_to :restaurant, if: -> {!is_manager?}
	has_many :order_items
end

def is_manager?
	scope == "manager"
end