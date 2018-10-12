class User < ApplicationRecord
	has_secure_password

	has_many :user_addresses
	has_many :addresses, through: :user_addresses

	has_many :favorite_restaurants
	has_many :favorited_restaurants, through: :favorite_restaurants, source: :restaurant

	has_many :orders

end