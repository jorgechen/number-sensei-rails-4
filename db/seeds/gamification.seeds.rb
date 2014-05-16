# experience level curve
ExperienceLevel.destroy_all
ExperienceFunction.destroy_all

levels = 100
xp_for_first_level = 100
xp_for_last_level = 40000

COEFFICIENT_B = Math.log(1.0 * xp_for_last_level / xp_for_first_level) / (levels - 1)
COEFFICIENT_A = 1.0 * xp_for_first_level / (Math.exp(COEFFICIENT_B) - 1.0)

puts "Coefficients A=#{COEFFICIENT_A}, B=#{COEFFICIENT_B}"

experience_function =
    ExperienceFunction.create!(coefficient_a: COEFFICIENT_A, coefficient_b: COEFFICIENT_B)

# NOTE: Users start from level 0, experience 0
ExperienceLevel.create(level: 0,
                       experience: 0,
                       level_up_experience: experience_function.calculate_level_up_experience(0))

cumulative_experience = 0

(1..levels).each do |level|

  cumulative_experience +=
      experience_function.calculate_experience_for_level(level) - experience_function.calculate_experience_for_level(level - 1)

  experience_to_level =
      experience_function.calculate_level_up_experience(level)

  lvl = ExperienceLevel.create(level: level,
                               experience: cumulative_experience,
                               level_up_experience: experience_to_level)

  puts "#{lvl}   \t #{lvl.experience} (0 / #{lvl.level_up_experience})"

end

experience_function.experience_levels << ExperienceLevel.all

