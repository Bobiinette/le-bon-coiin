Rails.application.routes.draw do
	get 'utilisateurs/new'
	get 'utilisateurs/show'
	get 'annonces/index'
	get 'annonces/new'
	get 'annonces/show'
	resources :utilisateurs
	resources :annonces
	root 'annonces#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
