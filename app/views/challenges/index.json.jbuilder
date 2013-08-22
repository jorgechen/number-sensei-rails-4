json.array!(@challenges) do |challenge|
  json.extract! challenge, :name, :checksum
  json.url challenge_url(challenge, format: :json)
end
