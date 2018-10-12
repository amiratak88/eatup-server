class Restaurant < ApplicationRecord
	belongs_to :address
	has_many :headings
	has_many :items
end
