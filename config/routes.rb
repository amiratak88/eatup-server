Rails.application.routes.draw do

	mount ActionCable.server => '/cable'

	post 'users/login', to: 'sessions#user_login'
	get 'users/persist', to: 'sessions#user_persist'
	
	get 'restaurants/search', to: 'restaurants#search'
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
