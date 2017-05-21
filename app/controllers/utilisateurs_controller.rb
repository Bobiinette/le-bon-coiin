class UtilisateursController < ApplicationController
  def home
    @annonces = Annonce.where(utilisateur_id: @utilisateur.id).all
  end

  def login
    if @utilisateur
      session[:utilisateur_id] = @utilisateur.id
      flash[:info] = "Bienvenue #{@utilisateur.pseudo} !"
    else
      session[:utilisateur_id] = nil
      flash[:info] = "Échec de la connexion"
    end
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
  	@utilisateur_temp = Utilisateur.new
    @utilisateur = nil
  end

  def create
    @utilisateur_temp = Utilisateur.new(utilisateur_params)
    if @utilisateur_temp.save
      @utilisateur = @utilisateur_temp
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
