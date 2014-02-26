json.array!(@inflations) do |inflation|
  json.extract! inflation, :id, :country, :year, :inflation
  json.url inflation_url(inflation, format: :json)
end
