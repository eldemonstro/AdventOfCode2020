# frozen_string_literal: true

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

# reducing to: [x, y, number_of_trees]
result = input.reduce([0, 0, 0]) do |acc, value|
  acc[0] = acc[0] - value.length if acc[0] >= value.length
  acc[2] += 1 if value[acc[0]] == "#"
  acc[0] += 3
  acc[1] += 1
  acc
end

puts result[2]
