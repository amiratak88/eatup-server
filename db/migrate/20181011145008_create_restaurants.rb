class CreateRestaurants < ActiveRecord::Migration[5.2]
	def change
    	create_table :restaurants do |t|
			t.string :name
			t.string :imgURL
			t.integer :address_id
			t.string :cuisine
			t.text :description
			t.integer :phone_number

			t.timestamps
    	end
	end
end
