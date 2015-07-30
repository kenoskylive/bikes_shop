json.array!(@rentals) do |rental|
  json.extract! rental, :id, :name, :manufacturer, :price, :image, :description
  json.url rental_url(rental, format: :json)
end
