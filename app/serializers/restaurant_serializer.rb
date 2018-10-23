class RestaurantSerializer < ActiveModel::Serializer
	attributes :id, :cuisine, :description
	belongs_to :address
	has_one :manager
end
