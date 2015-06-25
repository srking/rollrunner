json.array!(@orders) do |order|
  json.extract! order, :id, :name, :domain_id, :user_id
  json.url order_url(order, format: :json)
end
