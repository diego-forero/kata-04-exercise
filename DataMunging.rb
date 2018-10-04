class Comparison

  def difference(belonging, minimum, maximum)
    @smallest = (@data[0][minimum].to_i - @data[0][maximum].to_i).abs
    @owner = @data[0][belonging]

    @data.each do |item_comparison|
      if (item_comparison[minimum].to_i - item_comparison[maximum].to_i).abs < @smallest
        @smallest = (item_comparison[minimum].to_i - item_comparison[maximum].to_i).abs
        @owner = item_comparison[belonging]
      end
    end
  end
  def print_solution(problem_to_solve)
    "The #{problem_to_solve} is #{@owner} with difference of #{@smallest}."
  end
end


class FileOpening<Comparison

  attr_accessor :filename

  def initialize(params)
    @filename = params.fetch(:filename)
    @data = fix_data
    clean
  end

  def fix_data
    File.open(@filename, 'r') {|f| f.read }.lines.map(&:split)
  end

  def clean
    @data.delete_if { |elem| elem.empty? || elem[0].to_i == 0 }
  end
end

weather = FileOpening.new(filename: "weather.dat")
weather.difference(0,1,2)
puts weather.print_solution("day with the smallest temperature spread")

scores = FileOpening.new(filename: "football.dat")
scores.difference(1,6,8)
puts scores.print_solution("team with the smallest difference in 'for' and 'against' goals")
