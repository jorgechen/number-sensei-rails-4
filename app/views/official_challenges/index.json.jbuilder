json.array!(@official_challenges) do |official_challenge|
  json.extract! official_challenge, :upload, :name, :release_date, :grade_level, :difficulty, :event, :category, :location
  json.url official_challenge_url(official_challenge, format: :json)
end
