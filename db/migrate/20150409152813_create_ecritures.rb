class CreateEcritures < ActiveRecord::Migration
  def change
    create_table :ecritures do |t|
      t.string :journal
      t.date :date_ecriture
      t.string :compte
      t.string :libelle
      t.decimal :debit
      t.decimal :credit
      t.string :numero_facture
      t.string :mode_reglement
      t.string :lettrage
      t.date :echeance
      t.integer :numero_mouvement

      t.timestamps
    end
  end
end
