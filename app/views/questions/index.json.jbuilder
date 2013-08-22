json.array!(@questions) do |question|
  json.extract! question, :expression_id, :answer_id, :html, :plain_text, :answer_html, :answer_plain_text
  json.url question_url(question, format: :json)
end
