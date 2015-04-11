json.array!(@exercices) do |exercice|
  json.extract! exercice, :id, :start_date, :end_date
  json.url exercice_url(exercice, format: :json)
end
