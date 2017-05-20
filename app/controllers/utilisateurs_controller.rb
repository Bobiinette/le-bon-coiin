class UtilisateursController < ApplicationController
  def home
  end

  def login
  end

  def check
    @utilisateur = User.where(name: params[:name], password: params[:password]).first
    if @utilisateur
      session[:id] = @utilisateur.id
      flash[:info] = "Bienvenue #{@utilisateur.name} !"
      redirect_to  "/annonnces/index"
    else
      session[:id] = nil
      flash[:info] = "Échec de la connexion"
    end
  end

  def show
  	@utilisateur = Utilisateur.find(params[:id])
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
