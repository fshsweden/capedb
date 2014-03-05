json.array!(@payments) do |payment|
  json.extract! payment, :id, :belongs_to, :date_of_payment, :amount, :method, :desc
  json.url payment_url(payment, format: :json)
end
