json.array!(@rolls) do |roll|
  json.extract! roll, :id, :order_id, :user_id
  json.url roll_url(roll, format: :json)
end
