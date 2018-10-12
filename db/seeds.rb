# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Restaurant.destroy_all
Address.destroy_all
UserAddress.destroy_all
Manager.destroy_all
FavoriteRestaurant.destroy_all
Order.destroy_all
Heading.destroy_all
Item.destroy_all
OrderItem.destroy_all

user1 = User.create(first_name: "Amirata", last_name: "Khodaparast", username: "amirata", password: "123")

address1 = Address.create(line1: "108 Mill River Road", city: "Oyster Bay", state: "NY", zipcode: 11771, country: "USA")
address2 = Address.create(line1: "81 Prospect Street", city: "New York", state: "NY", zipcode: 12345, country: "USA")

user1.addresses << address1
user1.addresses << address2

res1 = Restaurant.create(name: "Ravagh", cuisine: "Persian", description: "Awesome persian food!")
res1.address = Address.create(line1: "210 Mineola Avenue", city: "Roslyn Heights", state: "NY", zipcode: 12345, country: "USA")

user1.favorited_restaurants << res1

Manager.create(first_name: "Kevin", last_name: "Rivera", username: "kevin", password: "123", restaurant_id: res1.id)

### res1 Menu ###
res1.headings.create(content: "Appetizers", order_index: 1)
res1.items.create(name: "Kashk Bademjan", description: "Cooked eggplant with tomatoe sauce topped with yogurt.", price: 7.00, order_index: 2)
res1.items.create(name: "Sambuseh", description: "Fried dumplings stuffed with crushed chickpeas and herbs.", price: 6.50, order_index: 3)
res1.headings.create(content: "Entrees", order_index: 4)
res1.items.create(name: "Koobideh Kebob", description: "Two skewers of seasoned juicy ground beef grilled to perfection.", price: 15.00, order_index: 5)

