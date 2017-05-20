Rails.application.routes.draw do
	get 'utilisateurs/home' => 'utilisateurs#home'
	get 'utilisateurs/login' => 'utilisateurs#login'
	post 'utilisateurs/login' => 'utilisateurs#check'
	get 'utilisateurs/new' => 'utilisateurs#new'
	get 'annonces/index' => 'annonces#index'
	get 'annonces/new' => 'annonces#new'
	get 'annonces/show' => 'annonces#show'
	resources :utilisateurs
	resources :annonces
	root 'annonces#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
