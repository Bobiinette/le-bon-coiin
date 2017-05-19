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
    @annonce = Annonce.create(annonce_params)
    if @annonce.save
      redirect_to action: 'index'
    else
      redirect_to action: 'index'
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
