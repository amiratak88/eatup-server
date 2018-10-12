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

user1 = User.create(first_name: "Amirata", last_name: "Khodaparast", username: "amirata", password: "123")

address1 = Address.create(line1: "108 Mill River Road", city: "Oyster Bay", state: "NY", zipcode: 11771, country: "USA")
address2 = Address.create(line1: "81 Prospect Street", city: "New York", state: "NY", zipcode: 12345, country: "USA")

user1.addresses << address1
user1.addresses << address2

res1 = Restaurant.create(name: "Bougie Deli", address_id: address1.id, cuisine: "Chu know!", description: "We're awesome!")

Manager.create(first_name: "Kevin", last_name: "Rivera", username: "kevin", password: "123", restaurant_id: res1.id)