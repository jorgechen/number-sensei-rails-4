  @submitChallenge = ->
    challenge_id = parseInt($('#challenge_id').text())
    data = $('input.question_submission').serialize()

    #TODO recognize which questions are missing vs which are not reached

    $.ajax "/challenges/#{challenge_id}/attempt",
      type: 'POST'
      data: data
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        $('body').append "AJAX Error: #{textStatus}"
      success: (data, textStatus, jqXHR) ->

#        # Expected format of the returned data
#        {
#          "1": { # Question ID as key
#            result: true, # If answered correctly
#            correct_answer: '2500' # Correct answer
#          }
#        }

        # Update the page from return data
        for question_id, grade of data

          feedback = '';

          if grade.result == 'correct'
            feedback = '<img alt="Tick" src="/images/tick.png">'
          else if grade.result != 'unfinished'
            #NOTE: answer is not shown if question has not been reached.
            feedback = '<span class="incorrect">' + grade.correct_answer + '</span>'

          if feedback
            element = $("#question_#{question_id} .row")
            question_body = element.find('.col-sm-12')
            question_body.toggleClass('col-sm-12').toggleClass('col-sm-11')
            element.prepend('<div class="col-sm-1">' + feedback + '</div>')
