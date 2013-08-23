json.array!(@tricks) do |trick|
  json.extract! trick, :strategy, :name
  json.url trick_url(trick, format: :json)
end
