Rails.application.routes.draw do
  get 'sessions/login_user'
  get 'sessions/login_manager'
  get 'sessions/persist_user'
  get 'sessions/persist_manager'
	mount ActionCable.server => '/cable'
	get 'restaurants/:id/orders/', to: 'managers#orders'
	post 'users/login', to: 'sessions#user_login'
	post 'managers/login', to: 'sessions#manager_login'

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
