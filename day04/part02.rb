# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n\n").map { |passport| passport.split.map { |str| str.split(":") }.to_h }

def height_check(height_str)
  return false unless height_str
  size = height_str[/\d+/].to_i
  type = height_str[-2..-1]

  if type == 'cm'
    size.between?(150, 193)
  elsif type == 'in'
    size.between?(59, 76)
  else
    false
  end
end

required_values = ['byr', 'iyr', 'eyr', 'hgt', 'hcl', 'ecl', 'pid'].sort
valid_colors = %w(amb blu brn gry grn hzl oth)

result = input.reduce(0) do |acc, passport|
  next acc if (passport.keys - ["cid"]).sort != required_values

  next acc unless passport["byr"].to_i.between?(1920, 2002)
  next acc unless passport["iyr"].to_i.between?(2010, 2020)
  next acc unless passport["eyr"].to_i.between?(2020, 2030)
  next acc unless passport["hcl"]&.match?(/#[0-9a-f]{6}/)
  next acc unless height_check(passport["hgt"])
  next acc unless passport["pid"]&.match?(/\d{9}/)
  next acc unless passport["pid"]&.length == 9
  next acc unless valid_colors.include?(passport["ecl"])

  acc += 1
  acc
end

puts result
