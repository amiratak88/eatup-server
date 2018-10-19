class Restaurant < ApplicationRecord
	belongs_to :address
	has_many :headings
	has_many :items
	has_one :manager
	has_many :orders

	def menu_items
		(headings + items).sort_by(&:order_index) # Refactor using avtive record
	end
end
