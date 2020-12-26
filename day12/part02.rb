# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

x = 0
y = 0
waypoint_x = 10
waypoint_y = 1
directions = ["W", "N", "E", "S"]
vector = [[-1, 0], [0, 1], [1, 0], [0, -1]]

input.each do |command|
  action, number = command[0], command[1..].to_i

  case action
  when 'R', 'L'
    number = (360 - number) if action == 'R'

    case number
    when 90
      temp = waypoint_x
      waypoint_x = -waypoint_y
      waypoint_y = temp
    when 180
      waypoint_x = -waypoint_x
      waypoint_y = -waypoint_y
    when 270
      temp = waypoint_x
      waypoint_x = waypoint_y
      waypoint_y = -temp
    end
  when 'F'
    x += waypoint_x * number
    y += waypoint_y * number
  else
    waypoint_x = waypoint_x + (number * vector[directions.index(action)][0])
    waypoint_y = waypoint_y + (number * vector[directions.index(action)][1])
  end
end

puts x.abs + y.abs
