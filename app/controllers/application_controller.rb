class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :utilisateur_courant

   def utilisateur_courant
    if session[:id]
      @utilisateur = Utilisateur.find(session[:id])
    end
  end
end
