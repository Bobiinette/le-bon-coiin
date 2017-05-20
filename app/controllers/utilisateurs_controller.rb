class UtilisateursController < ApplicationController
  def home
  end

  def login
  end

  def logout
    session[:utilisateur_id] = nil
    flash[:info] = "Vous êtes maintenant déconnecté."
    redirect_to "/annonces/index"
  end

  def check
    @utilisateur = Utilisateur.where(pseudo: params[:pseudo], pass: params[:pass]).first
    if @utilisateur
      session[:utilisateur_id] = @utilisateur.id
      flash[:info] = "Bienvenue #{@utilisateur.pseudo} !"
      redirect_to  "/annonces/index"
    else
      session[:utilisateur_id] = nil
      flash[:info] = "Échec de la connexion"
    end
  end

  def new
  	@utilisateur = Utilisateur.new
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save

      flash[:alert] = "Votre compte a bien été crée"
      redirect_to '/annonces/index'
    else
      flash[:alert] = "Votre compte n'a pas pu être crée"
      render "new"
    end
  end

  private
  def utilisateur_params
  	params.require(:utilisateur).permit(:nom, :prenom, :email, :telephone, :pseudo, :pass, :promotion, :avatar)
  end
end
