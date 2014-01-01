require 'sylvan_rails/knav_util'

# colors
map_of_colors = KnavUtil::load_from_yml(['db', 'seeds', 'colors.yml'])
map_of_colors.each do |h|
  Word.create(
      part_of_speech: 'adjective', #colors can be nouns too
      category: 'color',
      spelling: h['name'],
      note: h['color']
  )
end


# animals
map_of_animals = KnavUtil::load_from_yml(['db', 'seeds', 'animals.yml'])
map_of_animals.each do |h|
  Word.create(
      part_of_speech: 'noun',
      category: 'animal',
      spelling: h
  )
end
