# Seed questions based on current environment
# If in development, it takes millenniums to seed 10k questions, therefore we need to cut that down.

KnavUtil.print_with_padding "Questions in #{Rails.env} mode"
data = YAML::load_file(File.join(Rails.root, 'db', 'seeds', "questions.#{Rails.env}.yml"))
Barracks::build_all(data)
