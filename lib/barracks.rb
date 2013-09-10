################################################
## Barracks contain factory methods
################################################
module Barracks

  # 2 factor multiplication
  # @param a_start [Integer] smallest number for 1st factor
  # @param a_end   [Integer] biggest number for 1st factor
  # @param b_start [Integer] smallest number for 2nd factor
  # @param b_end   [Integer] biggest number for 2nd factor
  def self.basic_multiplication(a_start, a_end, b_start, b_end)
    (a_start..a_end).each do |i|
      (b_start..b_end).each do |j|
        q = Question::Multiplication.build i, j
        q.save!
        puts "id#{q.id}\t#{q.to_s}"
      end
    end
  end

end