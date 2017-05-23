Rails.application.routes.draw do
	get 'utilisateurs/home' => 'utilisateurs#home'
	get 'utilisateurs/login' => 'utilisateurs#login'
	post 'utilisateurs/login' => 'utilisateurs#check'
	get 'utilisateurs/new' => 'utilisateurs#new'
	delete 'utilisateurs/login' => 'utilisateurs#logout'
	delete 'annonces/destroy' => 'annonces#destroy'
	get 'annonces/edit' => "annonces#edit"
	get 'annonces/index' => 'annonces#index'
	get 'annonces/new' => 'annonces#new'
	get 'annonces/show' => 'annonces#show'
	post "/annonces/signaler" => 'annonces#signaler'
	get "/annonces/signaler" => 'annonces#index'
	resources :utilisateurs
	resources :annonces
	root 'annonces#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
