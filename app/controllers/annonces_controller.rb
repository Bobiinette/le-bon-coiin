class AnnoncesController < ApplicationController
  before_action :set_annonce, only: [:show, :edit, :update, :destroy]

  def index
  	@annonces = Annonce.all
  end

  def show
  end

  def new
    @annonce = Annonce.new
  end

  def create
    @utilisateur = Utilisateur.find(params[:utilisateur])
    @annonce = @utilisateur.annonces.create(annonce_params)
    if @annonce.save
      flash[:info] = "Salut"
      redirect_to @annonce
    else
      render 'new'
    end
  end

  private

  def set_annonce
    @annonce = Annonce.find(params[:id])
  end

  def annonce_params
  	params.require(:annonce).permit(:titre, :description, :prix, :photo, :utilisateur)
  end
end
