class AnnonceController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]

  def index
  	@annonces = Annonce.all
  end

  def show
    @annonce = Annonce.find(params[:id])
  end

  def new
    @annonces = Annonce.new
  end

  def create
    @annonces = Annonce.new(annonce_params)
    if @annonces.save
      flash[:alert] = "Votre annonce a bien été crée"
      redirect_to action:index
    else
      flash[:alert] = "Votre annonce n'a pas pu être crée"
      render "new"
    end
  end

  private

  def annonce_params
  	params.require(:annonce).permit(:titre, :description, :prix, :photo)
  end
end
