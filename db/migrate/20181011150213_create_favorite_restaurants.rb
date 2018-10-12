class CreateFavoriteRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_restaurants do |t|
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
