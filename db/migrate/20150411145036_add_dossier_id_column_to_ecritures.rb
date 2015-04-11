class AddDossierIdColumnToEcritures < ActiveRecord::Migration
  def change
    add_column :ecritures, :dossier_id, :integer
  end
end
