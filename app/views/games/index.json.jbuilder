json.array!(@games) do |game|
  json.extract! game, :id, :psn_price, :amazon_price, :title, :psn_id, :region
  json.url game_url(game, format: :json)
end
