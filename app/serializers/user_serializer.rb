class UserSerializer < ActiveModel::Serializer
	attributes :id, :first_name, :last_name, :username, :phone_number
	has_many :addresses
	has_many :favorited_restaurants, if: -> {is_user?}
	has_many :ordered_restaurants, if: -> {is_user?}
	has_many :orders, if: -> {is_user?}

	def is_user?
		scope == "user"
	end
end