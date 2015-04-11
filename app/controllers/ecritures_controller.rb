class EcrituresController < ApplicationController
  before_action :set_ecriture, only: [:show, :edit, :update, :destroy]

  before_filter :load_dossier

  respond_to :html

  def index
    @ecritures = @dossier.ecritures.all
    respond_with(@ecritures)
  end

  def show
    respond_with(@ecriture)
  end

  def new
    @ecriture = @dossier.ecritures.new
    respond_with(@ecriture)
  end

  def edit
  end

  def create
    @ecriture = @dossier.ecritures.new(ecriture_params)
    @ecriture.save
    respond_to do |format|
      if @ecriture.save
        format.html { redirect_to [@dossier, @ecriture], notice: 'Ecriture creer avec succes.' }
        format.json { render action: 'show', status: :created, location: @ecriture }
      else
        format.html { render action: 'new' }
        format.json { render json: @ecriture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @dossier.ecritures.find(params[:id])
    respond_to do |format|
      if @ecriture.update_attributes(ecriture_params)
        format.html { redirect_to [@dossier, @ecriture], notice: 'Exercice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ecriture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ecriture = @dossier.ecritures.find(params[:id])
    @ecriture.destroy
    respond_to do |format|
      format.html { redirect_to dossier_ecritures_path(@dossier) }
      format.json { head :no_content }
    end
  end
  
  private
    def set_ecriture
      @ecriture = Ecriture.find(params[:id])
    end

  def load_dossier
	@dossier = Dossier.find(params[:dossier_id])
    end

    def ecriture_params
      params.require(:ecriture).permit(:journal, :date_ecriture, :compte, :libelle, :debit, :credit, :numero_facture, :mode_reglement, :lettrage, :echeance, :numero_mouvement, :dossier_id )
    end
end
