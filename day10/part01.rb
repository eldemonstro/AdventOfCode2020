# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n").map(&:to_i)

input.sort!

input.push(input.max + 3)

# current rating is equal to the adapter adapter
# reducing to [current_rating, 1_difference, 3_difference]
result = input.reduce([0, 0, 0]) do |acc, adapter|
  [
    adapter,
    (adapter - acc[0] == 1 ? acc[1] : acc[1] + 1),
    (adapter - acc[0] == 3 ? acc[2] : acc[2] + 1),
  ]
end

puts result[1] * result[2]
