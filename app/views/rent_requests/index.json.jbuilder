json.array!(@rent_requests) do |rent_request|
  json.extract! rent_request, :id, :name, :email, :rent_type, :rent_duration, :bike_id
  json.url rent_request_url(rent_request, format: :json)
end
