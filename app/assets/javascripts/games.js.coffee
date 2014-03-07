$(document).ready ->
  $('#cryptogram_form').submit (event) ->
    event.preventDefault()

    question = $('#custom_question').val()
    answer = $('#custom_answer').val()

    $.post '/games/new_cryptogram',
      question: question
      answer: answer
      (data) -> $('#answer_key').html data

    # Update the answer table
    answer = $('#custom_answer').val()


