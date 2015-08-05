json.array!(@bikes) do |bike|
  json.extract! bike, :id, :bike_name, :price_per_day, :price_per_week, :descrition
  json.url bike_url(bike, format: :json)
end
