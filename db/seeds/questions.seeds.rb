# Seed questions based on current environment
# TODO use seed-fu or such to seed many questions in the background

KnavUtil.print_with_padding "Questions in #{Rails.env} mode"

data = Barracks::data()

Barracks::build_all(data)
