class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]

  def index
  	@annonce = Annonce.all
  end

  def show
    @annonce = Annonce.find(params[:id])
  end

  def new
    @annonce = Annonce.new
  end

  def create
    @annonce = Annonce.new(annonce_params)
    if @annonce.save
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
