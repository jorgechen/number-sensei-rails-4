json.array!(@challenge_categories) do |challenge_category|
  json.extract! challenge_category, :name, :description
  json.url challenge_category_url(challenge_category, format: :json)
end
