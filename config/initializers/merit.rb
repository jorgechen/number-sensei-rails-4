# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)

# George's Observations:
# - In development, the badges are created on every restart of the Rails console/server
# - Order matters. A user's badge save is connected to the ID, so if he gets badge A at ID 1, if you change badge B to ID2, user will instead have badge B.

# ALWAYS APPEND NEW ACHIEVEMENTS AT END OF THIS LIST, NEVER INSERT IN RANDOMLY
badge_id = 0
[
    {
        name: 'Fresh Meat',
        custom_fields: {
            category: 'basic',
        },
        id: (badge_id = badge_id + 1)
    },
    {
        name: 'Piece of Pi',
        level: 1,
        description: 'Answer 314 questions about circles and spheres.',
        custom_fields: {
            category: 'geometry',
            difficulty: :bronze
        },
        id: (badge_id = badge_id + 1)
    },
    {
        name: 'Piece of Pi',
        level: 2,
        description: 'Answer 3142 questions about circles and spheres.',
        custom_fields: {
            category: 'geometry',
            difficulty: :silver
        },
        id: (badge_id = badge_id + 1)
    },
    {
        name: 'Piece of Pi',
        level: 3,
        description: 'Answer 31416 questions about circles and spheres.',
        custom_fields: {
            category: 'geometry',
            difficulty: :gold
        },
        id: (badge_id = badge_id + 1)
    },
    {
        name: 'Wet Feet',
        description: 'Complete a challenge.',
        custom_fields: {
            category: 'basic',
        },
        id: (badge_id = badge_id + 1)
    },
].each do |attributes|
  Merit::Badge.create! attributes
end
