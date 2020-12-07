# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

def row_number(str_code)
  str_code.split('').map { |code| code == "F" ? 0 : 1 }.join.to_i(2)
end

def column_number(str_code)
  str_code.split('').map { |code| code == "L" ? 0 : 1 }.join.to_i(2)
end

result = input.reduce(0) do |highest, seat|
  row_code = seat[0..6]
  column_code = seat[-3..-1]

  seat_id = row_number(row_code) * 8 + column_number(column_code)

  seat_id > highest ? seat_id : highest
end

puts result
