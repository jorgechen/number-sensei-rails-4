# experience level curve
ExperienceLevel.delete_all

levels = 20
xp_for_first_level = 100
xp_for_last_level = 200000

BB = Math.log(1.0 * xp_for_last_level / xp_for_first_level) / (levels - 1)
AA = 1.0 * xp_for_first_level / (Math.exp(BB) - 1.0)

puts "Coefficients A=#{AA}, B=#{BB}"

def self.xp_for_level(i)
  x = (AA * Math.exp(BB * i)).to_i
  y = 10**(Math.log(x) / Math.log(10) - 2.2).to_i
  (x / y).to_i * y
end

# starting level is always 0
ExperienceLevel.create(level: 0, experience: 0)

cumulative_experience = 0
(1..levels).each do |i|
  experience_to_level = xp_for_level(i) - xp_for_level(i-1)
  cumulative_experience += experience_to_level
  lvl = ExperienceLevel.create(level: i, experience: cumulative_experience, delta: experience_to_level)
  puts "#{lvl} #{lvl.experience} (+#{lvl.delta})"
end

