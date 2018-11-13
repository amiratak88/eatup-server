class Manager < ApplicationRecord
	has_secure_password
	belongs_to :restaurant
	has_many :orders
end
