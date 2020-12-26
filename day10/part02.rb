# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n").map(&:to_i)

def valid_combination?(adapters, start, last)
  return false unless adapters.include?(start) && adapters.include?(last)

  (1..(adapters.length - 1)).each do |index|
    return false if adapters[index] - adapters[index - 1] > 3
  end
  return true
end

input.sort!
input.unshift(0)
input.push(input.max + 3)
diff_3 = 0

adapter_chunks = [[]]

(0..(input.length - 1)).each do |index|
  if input[index] - input[index - 1] == 3
    diff_3 += 1
    adapter_chunks[diff_3] ||= []
  end

  adapter_chunks[diff_3] << input[index]
end

result = adapter_chunks.map do |chunk|
  (1..chunk.count)
    .flat_map { |n| chunk.combination(n).to_a }
    .map { |combination| valid_combination?(combination, chunk[0], chunk[-1]) }
    .count(true)
end

puts result.reduce(:*)
