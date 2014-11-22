Rails.application.routes.draw do
	get 'landings/index'

	devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]
	devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	root 'landings#index'

	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products
	
	#->Prelang (user_login:devise/stylized_paths)
	devise_scope :user do
		get    "login"   => "users/sessions#new",         as: :new_user_session
		post   "login"   => "users/sessions#create",      as: :user_session
		delete "signout" => "users/sessions#destroy",     as: :destroy_user_session
		
		get    "signup"  => "users/registrations#new",    as: :new_user_registration
		post   "signup"  => "users/registrations#create", as: :user_registration
		put    "signup"  => "users/registrations#update", as: :update_user_registration
		get    "account" => "users/registrations#edit",   as: :edit_user_registration

		get 	"funds"   => "users/funds#index", as: :funds
		get 	"funds/deposit"   => "users/funds#edit", as: :edit_funds

	end

end
