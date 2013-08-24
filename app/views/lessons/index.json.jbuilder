json.array!(@lessons) do |lesson|
  json.extract! lesson, :name, :numbering, :course_id
  json.url lesson_url(lesson, format: :json)
end
