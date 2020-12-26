# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n").map(&:to_i)

preamble = input.take(25)
input = input.drop(25)

begin
  while true
    sums = preamble.permutation(2).map(&:sum)
    number = input.shift
    raise number.to_s unless sums.include?(number)
    preamble.shift
    preamble.push(number)
  end
rescue => e
  puts e
end
