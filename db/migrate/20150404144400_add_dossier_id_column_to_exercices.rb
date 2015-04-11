class AddDossierIdColumnToExercices < ActiveRecord::Migration
  def change
    add_column :exercices, :dossier_id, :integer
  end
end
