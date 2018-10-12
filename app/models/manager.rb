class Manager < ApplicationRecord
	has_secure_password
	belongs_to :restaurant
end
