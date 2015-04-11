class CreateDossiers < ActiveRecord::Migration
  def change
    create_table :dossiers do |t|
      t.string :raison_sociale
      t.string :rcs_ville
      t.string :siren
      t.string :nic
      t.string :forme_juridique
      t.boolean :societe_mono_etablissement
      t.string :code_naf
      t.integer :regime_fiscal_id
      t.integer :adresse_id
      t.date :date_creation
      t.decimal :capital
      t.integer :nombre_action
      t.string :activite_principale
      
      t.timestamps
    end
  end
end
