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
      redirect_to action: 'index'
    else
      redirect_to action: 'index'
    end
  end

  private

  def annonce_params
  	params.require(:annonce).permit(:titre, :description, :prix, :photo)
  end
end
