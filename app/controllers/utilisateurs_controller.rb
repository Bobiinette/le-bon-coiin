class UtilisateursController < ApplicationController

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
      redirect_to action:index
    else
      flash[:alert] = "Votre compte n'a pas pu être crée"
      render "new"
    end
  end

  private

  def utilisateur_params
  	params.require(:utilisateur).permit(:nom, :prenom, :email, :telephone, :pseudo, :pass, :avatar)
  end
end
