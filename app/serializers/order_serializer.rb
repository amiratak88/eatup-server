class OrderSerializer < ActiveModel::Serializer
	attributes :id, :status
	belongs_to :user, if: -> {is_manager?}
	belongs_to :restaurant, if: -> {!is_manager?}
	has_many :order_items

	def is_manager?
		scope == "manager"
	end
end