Rails.application.routes.draw do
	mount ActionCable.server => '/cable'

	get 'restaurants/:id/orders/', to: 'managers#orders'

	resources :user_addresses
	resources :order_items
	resources :headings
	resources :items
	resources :orders
	resources :favorite_restaurants
	resources :addresses
	resources :managers
	resources :users
	resources :restaurants
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
