class Address < ApplicationRecord
	has_one :restaurant
	has_many :user_addresses
	has_many :users, through: :user_addresses
end
