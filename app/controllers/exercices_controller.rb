class ExercicesController < ApplicationController
  before_action :set_exercice, only: [:show, :edit, :update, :destroy]
  
  before_filter :load_dossier
  
  respond_to :html

  def index
    @exercices = @dossier.exercices.all
    respond_with(@exercices)
  end

  def show
    @exercice = @dossier.exercices.find(params[:id])
    respond_with(@exercice)
  end

  def new
    @exercice = @dossier.exercices.new
    respond_with(@exercice)
  end

  def edit
  end

  def create
    @exercice = @dossier.exercices.new(exercice_params)
    respond_to do |format|
      if @exercice.save
        format.html { redirect_to [@dossier, @exercice], notice: 'Exercice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @exercice }
      else
        format.html { render action: 'new' }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @dossier.exercices.find(params[:id])
    respond_to do |format|
      if @exercice.update_attributes(exercice_params)
        format.html { redirect_to [@dossier, @exercice], notice: 'Exercice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @exercice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @exercice = @dossier.exercices.find(params[:id])
    @exercice.destroy
    respond_to do |format|
      format.html { redirect_to dossier_exercices_path(@dossier) }
      format.json { head :no_content }
    end
  end

  private
    def set_exercice
      @exercice = Exercice.find(params[:id])
    end

    def load_dossier
	@dossier = Dossier.find(params[:dossier_id])
    end

    def exercice_params
      params.require(:exercice).permit(:start_date, :end_date, :dossier_id)
    end
end
