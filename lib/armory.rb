################################################
## Armory provides helpers
################################################
module Armory

  # Assigns the given question to any applicable trick that currently exist.
  #@param question [Question]
  def self.assign_tricks(question)
    Trick.all.each do |t|
      if t.question_qualifies? question
        begin
          # If the relationship already exists between QUESTION and TRICK,
          # then an exception must be caught.
          question.tricks << t
        rescue Exception => e
          puts e.message
          puts e.backtrace.inspect
        end
      end
    end
  end

  # Assigns a given trick to applicable questions.
  #@param trick [Trick]
  def self.assign_questions(trick)
    questions = trick.possible_questions
    puts "Iterating over #{questions.count} questions"
    questions.find_each do |q|
      if trick.question_qualifies?(q)
        begin
          q.tricks << trick
        rescue Exception => e
          puts e.message
          puts e.backtrace.inspect
        end
      end
    end
  end

end