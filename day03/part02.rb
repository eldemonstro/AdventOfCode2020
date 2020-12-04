# frozen_string_literal: true

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

result = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]].map do |slope|
  number_of_trees = 0
  x = 0
  y = 0

  while(y < input.length)
    x = x - input[y].length if x >= input[y].length
    number_of_trees += 1 if input[y][x] == "#"
    x += slope[0]
    y += slope[1]
  end

  number_of_trees
end

puts result.inject(:*)
