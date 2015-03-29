class CreateDossiers < ActiveRecord::Migration
  def change
    create_table :dossiers do |t|
      t.string :RaisonSociale
      t.string :Type
      t.string :FormeJuridique
      t.string :SIRET
      t.string :Activite
      t.string :CodeNAF
      t.string :Adresse
      t.string :Ville
      t.string :CodePostal
      t.string :Pays
      t.integer :Telephone1
      t.integer :Telephone2
      t.integer :Fax
      t.string :Email
      t.string :NACE
      t.string :numURSSAF
      t.string :RefURSSAF
      t.string :CodeURSSAF
      t.string :AgrementANSP

      t.timestamps
    end
  end
end
