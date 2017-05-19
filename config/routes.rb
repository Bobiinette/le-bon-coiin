Rails.application.routes.draw do
  get 'utilisateur/index'

  get 'utilisateur/show'

  get 'utilisateur/new'

	resources :annonce
	resources :annonce
	root 'annonce#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
