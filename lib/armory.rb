################################################
## Armory provides helpers
################################################
module Armory

  # Assigns the given question to any applicable trick that currently exist
  #@param question [Question]
  def self.assign_tricks(question)
    Trick.all.each do |t|
      if t.question_qualifies? question
        begin
          question.tricks << t
        rescue Exception => e
          puts e.message
        end
      end
    end
  end

end