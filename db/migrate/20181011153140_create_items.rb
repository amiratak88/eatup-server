class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
	  t.integer :order_index
	  t.integer :restaurant_id

      t.timestamps
    end
  end
end
