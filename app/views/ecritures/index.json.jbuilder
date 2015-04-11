json.array!(@ecritures) do |ecriture|
  json.extract! ecriture, :id, :journal, :date_ecriture, :compte, :libelle, :debit, :credit, :numero_facture, :mode_reglement, :lettrage, :echeance, :numero_mouvement
  json.url ecriture_url(ecriture, format: :json)
end
