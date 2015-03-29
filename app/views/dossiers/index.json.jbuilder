json.array!(@dossiers) do |dossier|
  json.extract! dossier, :id, :RaisonSociale, :Type, :FormeJuridique, :SIRET, :Activite, :CodeNAF, :Adresse, :Ville, :CodePostal, :Pays, :Telephone1, :Telephone2, :Fax, :Email, :NACE, :numURSSAF, :RefURSSAF, :CodeURSSAF, :AgrementANSP
  json.url dossier_url(dossier, format: :json)
end
