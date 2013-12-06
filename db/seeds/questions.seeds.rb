# Seed questions

after :tricks do
  KnavUtil.print_with_padding "Questions in #{Rails.env} mode"

  # NOTE: We can selectively seed at /play_god,
  #       so there is no point to put everything here.
  #TODO seed a basic set of questions?

  question1 = Question::Multiplication.build(3, 5)
  question1.save

  #data = Barracks::data()
  #Barracks::build_all(data)
end