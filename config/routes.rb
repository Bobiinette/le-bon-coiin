Rails.application.routes.draw do
	get 'utilisateurs/home' => 'utilisateurs#home'
	post 'utilisateurs/login' => 'utilisateurs#login'
	get 'utilisateurs/check' => 'utilisateurs#check'
	get 'utilisateurs/new' => 'utilisateurs#new'
	get 'utilisateurs/show' => 'utilisateurs#show'
	get 'annonces/index' => 'annonces#index'
	get 'annonces/new' => 'annonces#new'
	get 'annonces/show' => 'annonces#show'
	resources :utilisateurs
	resources :annonces
	root 'annonces#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
