data = YAML::load_file(File.join(Rails.root, 'db', 'seeds', "questions.#{Rails.env}.yml"))

if (list = data[:multiplication])
  puts 'Two factor multiplication'
  list.each do |h|
    Barracks::build_multiplication(h[:first_factor][:start],
                                   h[:first_factor][:finish],
                                   h[:second_factor][:start],
                                   h[:second_factor][:finish])
  end
end
