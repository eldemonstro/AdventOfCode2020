# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n").map(&:to_i)

target_number = 69316178

input.count.times do |iteration|
  set = []

  while(set.sum < target_number)
    set << input[iteration + set.count]
  end

  if set.sum == target_number
    puts set.max + set.min
    break
  end
end
