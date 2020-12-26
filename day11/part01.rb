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

while(input.flatten.join.count("#") != last_seat_count)
  last_seat_count = input.flatten.count("#")

  state_snapshot = input.dup

  rows.times do |index|
    columns.times do |jndex|
      next if input[index][jndex] == '.'
      number_occupied_seats = [
        (state_snapshot[index - 1][jndex - 1]),
        (state_snapshot[index][jndex - 1]),
        (state_snapshot[index + 1][jndex - 1]),

        (state_snapshot[index - 1][jndex]),
        (state_snapshot[index + 1][jndex]),

        (state_snapshot[index - 1][jndex + 1]),
        (state_snapshot[index][jndex + 1]),
        (state_snapshot[index + 1][jndex + 1])
      ].count("#")


      if number_occupied_seats >= 4 && state_snapshot[index][jndex] == "#"
        input[index][jndex] = 'L'
      elsif number_occupied_seats == 0 && state_snapshot[index][jndex] == "L"
        input[index][jndex] = '#'
      end
    end
  end
end


puts last_seat_count

