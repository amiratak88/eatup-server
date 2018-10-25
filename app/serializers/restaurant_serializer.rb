class RestaurantSerializer < ActiveModel::Serializer
	attributes :id, :name, :cuisine, :description, :imgURL
	belongs_to :address
	has_one :manager
	has_many :items
end