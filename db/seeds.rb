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

# Users

	user_amirata = User.create(first_name: "Amirata", last_name: "Khodaparast", username: "amirata", password: "123")
	user_kevin = User.create(first_name: "Kevin", last_name: "Rivera", username: "kevin", password: "123")
	user_gabe = User.create(first_name: "Gabe", last_name: "Batista", username: "gabe", password: "123")


# Addresses

	address_amirata_1 = user_amirata.addresses.create(line1: "Amirata's address 1", city: "Oyster Bay", state: "NY", zipcode: 11771, country: "USA")
	address_amirata_2 = user_amirata.addresses.create(line1: "Amirata's address 2", city: "New York", state: "NY", zipcode: 12345, country: "USA")

	address_kevin_1 = user_kevin.addresses.create(line1: "Kevin's address 1", city: "Oyster Bay", state: "NY", zipcode: 11771, country: "USA")
	address_kevin_2 = user_kevin.addresses.create(line1: "Kevin's address 2", city: "New York", state: "NY", zipcode: 12345, country: "USA")

	address_gabe_1 = user_gabe.addresses.create(line1: "Gabe's address 1", city: "Oyster Bay", state: "NY", zipcode: 11771, country: "USA")

	ravagh_address = Address.create(line1: "210 Mineola Ave", city: "Roslyn Heights", state: "NY", zipcode: 11771, country: "USA")

	marios_address = Address.create(line1: "82 Pine Hollow Rd", city: "Oyster Bay", state: "NY", zipcode: 11771, country: "USA")

# Restaurants

	res_ravagh = Restaurant.create(name: "Ravagh", cuisine: "Persian", description: "Awesome persian food!", address_id: ravagh_address.id, imgURL: 'https://ravaghrestaurants.com/images/ravaghmainlogo.jpg?crc=65102799')
	res_marios = Restaurant.create(name: "Mario's Pizzeria", cuisine: "Italian", description: "Pizza and etc", address_id: marios_address.id, imgURL: 'http://www.eastnorwich.com/wp-content/uploads/2011/01/marios.gif')

# Managers

	Manager.create(first_name: "Scarlett", last_name: "Perry", username: "scarlett", password: "123", restaurant_id: res_ravagh.id)
	Manager.create(first_name: "Rosa", last_name: "Tu", username: "rosa", password: "123", restaurant_id: res_marios.id)

# Menus

	# Ravagh's Menu

	res_ravagh.headings.create(content: "Appetizers", order_index: 1)
	kashk = res_ravagh.items.create(name: "Kashk Bademjan", description: "Cooked eggplant with tomatoe sauce topped with yogurt.", price: 7.00, order_index: 2, imgURL: 'https://images.food52.com/33VE1wTkP4lHiY6OSstPZ0qSJvs=/753x502/7e2e6284-bcaf-453e-9c97-04307e7c435b--IMG_2178.jpg')
	sambuseh = res_ravagh.items.create(name: "Sambuseh", description: "Fried dumplings stuffed with crushed chickpeas and herbs.", price: 6.50, order_index: 3, imgURL: 'https://cdn01.eavartravel.com/2018/8/e21b3c57-6e28-4907-8d2c-81983b7250f3.jpg')
	res_ravagh.headings.create(content: "Entrees", order_index: 4)
	koobideh = res_ravagh.items.create(name: "Koobideh Kebob", description: "Two skewers of seasoned juicy ground beef grilled to perfection.", price: 15.00, order_index: 5, imgURL: 'http://paymons.com/wp-content/uploads/2015/12/paymons_broiled_ground_beef_kabob_sep_21st_2015.jpg')
	chicken_kebob = res_ravagh.items.create(name: "Chicken Kebob", description: "Cubes of checken breast marinated in saffron on a skewer grilled to perfection.", price: 13.50, order_index: 6, imgURL: 'https://www.onceuponachef.com/images/2013/07/honey-lime-sriracha-chicken-skewers1.jpg')

	# Mario's Menu

	res_marios.headings.create(content: "Appetizers", order_index: 1)
	garlic_knots = res_marios.items.create(name: "Garlic Knots", description: "It's just garlic knots.", price: 3.50, order_index: 2, imgURL: 'https://dinnerthendessert.com/wp-content/uploads/2015/10/Garlic-Knots-Side.jpg')
	mozzarella_sticks = res_marios.items.create(name: "Mozzarella Sticks", description: "Mozzarella Sticks description", price: 5.50, order_index: 3, imgURL: 'https://truffle-assets.imgix.net/pxqrocxwsjcc_42oWcK0OFiaYgA0MywKoWM_mac-and-cheese-sticks_landscapeThumbnail_en.jpeg')
	res_marios.headings.create(content: "Pizza", order_index: 4)
	pepperoni_slice = res_marios.items.create(name: "Pepperoni Slice", description: "Pepperoni slice description", price: 3.50, order_index: 5, imgURL: 'https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/4622464/910/607/m1/fpnw/wm1/uma5dolvtfg337qd2afe8qkmeiknrx37sg5dr0tw887ngq1aopvkyjn21pt1twag-.jpg?1529326750&s=095ee7aef5d935e28d0f918505c5e423')
	plain_slice = res_marios.items.create(name: "Plain Slice", description: "Plain slice description", price: 4.50, order_index: 6, imgURL: 'http://static.menutabapp.com/img/cache/800x600/2012/07/24/c828e77c8c4847996888d0b436b98298.jpeg')

# Favorites
	user_kevin.favorited_restaurants << res_ravagh
	user_kevin.favorited_restaurants << res_marios
	user_amirata.favorited_restaurants << res_marios

# Orders

	# Order 1

	order1 = user_kevin.orders.create(restaurant_id: res_ravagh.id)
	order1.items << kashk
	order1.items << koobideh

	# Order 2

	order2 = user_amirata.orders.create(restaurant_id: res_marios.id)
	order2.items << plain_slice
	order2.items << pepperoni_slice

	# Order 3

	order3 = user_gabe.orders.create(restaurant_id: res_marios.id)
	order3.items << plain_slice
	order3.items << pepperoni_slice

	# Order 4

	order4 = user_gabe.orders.create(restaurant_id: res_ravagh.id)
	order4.items << chicken_kebob
	order4.items << sambuseh