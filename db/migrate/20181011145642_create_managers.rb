class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
	  t.string :password_digest
	  t.integer :restaurant_id

      t.timestamps
    end
  end
end
