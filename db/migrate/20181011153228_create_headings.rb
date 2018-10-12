class CreateHeadings < ActiveRecord::Migration[5.2]
  def change
    create_table :headings do |t|
      t.string :content
	  t.integer :order_index
	  t.integer :restaurant_id

      t.timestamps
    end
  end
end