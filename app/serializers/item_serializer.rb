class ItemSerializer < ActiveModel::Serializer
	attributes :id, :name, :imgURL, :description, :price, :order_index
end
