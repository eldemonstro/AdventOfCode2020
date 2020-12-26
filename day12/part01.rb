# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

x = 0
y = 0
direction = "E"
directions = ["W", "N", "E", "S"]
vector = [[-1, 0], [0, 1], [1, 0], [0, -1]]


input.each do |command|
  action, number = command[0], command[1..].to_i

  case action
  when 'R'
    direction = directions[(directions.index(direction) + (number / 90)) % 4]
  when 'L'
    direction = directions[(directions.index(direction) - (number / 90)) % 4]
  when 'F'
    x = x + (number * vector[directions.index(direction)][0])
    y = y + (number * vector[directions.index(direction)][1])
  else
    x = x + (number * vector[directions.index(action)][0])
    y = y + (number * vector[directions.index(action)][1])
  end
end

puts x.abs + y.abs
