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
        flash[:info] = "Votre annonce a bien été crée"
        redirect_to @annonce
      else
        flash[:alert] = "Impossible de créer l'anonce"
        render 'new'
      end
    else
      flash[:alert] = "Vous devez être connectées pour créer une annonce"
    end
  end

  def edit
  end

  def update
    if @annonce.update(annonce_params)
      flash[:info] = "Votre annonce a bien été éditée"
      redirect_to @annonce
    else
      flash[:alert] = "Impossible d'éditer' l'anonce"
      render 'edit'
    end
  end

  def destroy
    @annonce.destroy
    @annonce = nil
    flash[:info] = "Votre annonce a bien été supprimée"
    redirect_to 'index'
  end

  def signaler
    if @utilisateur
      UsermailerMailer.signal_mail().deliver
      flash[:info] = "L'annonce @annonce.titre a été signalée"
      redirect_to '/annonces/index'
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
