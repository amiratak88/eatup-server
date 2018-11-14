class RestaurantSerializer < ActiveModel::Serializer
	attributes :id, :name, :cuisine, :description, :imgURL, :phone_number
	belongs_to :address
	# has_one :manager
	has_many :items
	# has_many :orders
end