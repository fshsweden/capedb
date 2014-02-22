json.array!(@earnings) do |earning|
  json.extract! earning, :id, :belongs_to, :date_of_entry, :year, :profit
  json.url earning_url(earning, format: :json)
end
