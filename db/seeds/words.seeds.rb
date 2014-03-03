require 'sylvan_rails/knav_util'

KnavUtil.print_with_padding 'Words'

# colors
map_of_colors = YAML::load_file(File.join(Rails.root, 'db', 'seeds', 'colors.yml'))
map_of_colors.each do |h|
  Word.create(
      part_of_speech: 'adjective', #colors can be nouns too
      category: 'color',
      spelling: h['name'],
      note: h['color'] # The hex of the color
  )
end


# animals
map_of_animals = YAML::load_file(File.join(Rails.root, 'db', 'seeds', 'animals.yml'))
map_of_animals.each do |h|
  Word.create(
      part_of_speech: 'noun',
      category: 'animal',
      spelling: h
  )
end


fruits = YAML::load_file(File.join(Rails.root, 'db', 'seeds', 'fruits.yml'))
fruits.each do |fruit_name|
  Word.create(
      part_of_speech: 'noun',
      category: 'fruit',
      spelling: fruit_name
  )
end


vegetables = YAML::load_file(File.join(Rails.root, 'db', 'seeds', 'vegetables.yml'))
vegetables.each do |veggie_name|
  Word.create(
      part_of_speech: 'noun',
      category: 'vegetable',
      spelling: veggie_name
  )
end
