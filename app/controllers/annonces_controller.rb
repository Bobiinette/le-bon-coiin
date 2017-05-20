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
    if @utilisateur != nil
      @annonce = @utilisateur.annonces.create(annonce_params)
      if @annonce.save
        flash[:info] = "Salut"
        redirect_to @annonce
      else
        flash[:alert] = "Impossible de créer l'anonce"
        render 'new'
      end
    else
      flash[:alert] = "Vous devez être connectées pour créer une annonce"
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
