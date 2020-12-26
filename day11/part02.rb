# frozen_string_literal: true

class SpecialArray < Array
  def [](i)
    return super(i) unless i < 0 || i >= self.count
    return []
  end

  def dup
    Marshal::load(Marshal.dump(self))
  end
end

require 'amazing_print'
require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = SpecialArray.new text.split("\n").map { |line| SpecialArray.new(line.split("")) }

last_seat_count = -1
rows = input.count
columns = input[0].count

seat_map = {}

def traceSeat(seats, x, y, vector_x, vector_y)
  return nil if seats[x][y] == '.'

  x += vector_x
  y += vector_y

  while(seats[x][y] != "L")
    x += vector_x
    y += vector_y

    return nil if seats[x][y] == [] || seats[x][y] == nil
  end

  [x, y]
end

def traceSeats(seats, x, y)
  [
    traceSeat(seats, x, y, -1, -1),
    traceSeat(seats, x, y,  0, -1),
    traceSeat(seats, x, y,  1, -1),

    traceSeat(seats, x, y, -1,  0),
    traceSeat(seats, x, y,  1,  0),

    traceSeat(seats, x, y, -1,  1),
    traceSeat(seats, x, y,  0,  1),
    traceSeat(seats, x, y,  1,  1)
  ].compact
end

rows.times do |index|
  columns.times do |jndex|
    seat_map["#{index}x#{jndex}"] = traceSeats(input, index, jndex)
  end
end

seat_map.reject! { |k, v| v == [] }

while(input.flatten.join.count("#") != last_seat_count)
  last_seat_count = input.flatten.count("#")

  state_snapshot = input.dup

  rows.times do |index|
    columns.times do |jndex|
      next if input[index][jndex] == '.'

      number_occupied_seats = seat_map["#{index}x#{jndex}"].map do |seat|
        state_snapshot[seat[0]][seat[1]]
      end.count('#')

      if number_occupied_seats >= 5 && state_snapshot[index][jndex] == "#"
        input[index][jndex] = 'L'
      elsif number_occupied_seats == 0 && state_snapshot[index][jndex] == "L"
        input[index][jndex] = '#'
      end
    end
  end
end


puts last_seat_count

