class UserSerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :username
	has_many :addresses
	has_many :favorited_restaurants
	has_many :ordered_restaurants
	has_many :orders
end