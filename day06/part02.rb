# frozen_string_literal: true

require 'pry'

text = file.open(__dir__ + '/input.txt').read

input = text.split("\n\n")

result = input.reduce(0) do |acc, customs|
  acc + customs.split("\n").reduce(("a".."z").to_a) do |memo, answer|
    answer.split("") & memo
  end.count
end

puts result
