# frozen_string_literal: true

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n\n").map { |str| str.split.join(' ') }

required_values = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'].sort

result = input.reduce(0) do |acc, passport|
  (passport.scan(/(...):/m).compact.flatten - ["cid"]).sort == required_values ? acc += 1 : acc
end

puts result
