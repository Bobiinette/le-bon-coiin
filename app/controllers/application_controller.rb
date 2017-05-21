class ApplicationController < ActionController::Base
 	protect_from_forgery with: :exception
 	before_action :utilisateur_courant

   def utilisateur_courant
    if session[:utilisateur_id]
      @utilisateur = Utilisateur.find(session[:utilisateur_id])
    end
  end
end
