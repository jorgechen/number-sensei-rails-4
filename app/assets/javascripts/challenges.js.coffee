$(document).ready ->

  # User submits her answers which are graded immediately.
  $('#challenge').submit (event) ->
    event.preventDefault()

    challenge_id = parseInt($('#challenge_id').text())
    data = $(this).serialize()

    #TODO recognize which questions are missing vs which are not reached

    $.ajax "/challenges/#{challenge_id}/attempt",
      type: 'POST'
      data: data
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->
        # Time to grade what's on the page
        for question_id, grade of data
          feedback_element = $("span.#{question_id}")
          if grade == true
            feedback_element.html('<img alt="Tick" src="/images/tick.png">')
          else
            #TODO do not show correct answer if that question has not been reached.
            feedback_element.text(grade)