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

seats = Array.new { Array.new }

128.times do |i|
  8.times do |j|
    seats[i] ||= []
    seats[i][j] = "E"
  end
end

input.each do |seat|
  row_code = seat[0..6]
  column_code = seat[-3..-1]

  seats[row_number(row_code)][column_number(column_code)] = "X"
end

first_seats = true

seats.each_with_index do |row, index|
  next if first_seats && !row.include?('X')
  next if !first_seats && !row.include?('E')
  if first_seats
    row.each_with_index do |column, jndex|
      if column == 'X' && first_seats
        first_seats = false
      elsif column == 'E' && !first_seats
        raise "#{index * 8 + jndex}"
      end
    end
    next
  end

  if row.include?('E') && !first_seats
    raise "#{index * 8 + row.index('E')}"
  end
rescue => e
  puts e.message
  break
end
