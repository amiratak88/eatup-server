class CreateRestaurants < ActiveRecord::Migration[5.2]
	def change
    	create_table :restaurants do |t|
			t.string :name
			t.integer :address_id
			t.string :cuisine
			t.text :description

			t.timestamps
    	end
	end
end
