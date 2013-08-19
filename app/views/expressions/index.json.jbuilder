json.array!(@expressions) do |expression|
  json.extract! expression, :token, :type, :parent_id
  json.url expression_url(expression, format: :json)
end
