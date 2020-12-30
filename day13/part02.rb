# frozen_string_literal: true

require 'amazing_print'
require 'pry'

text = File.open(__dir__ + '/input.txt').read

_, buses = text.split("\n")

buses = buses.split(',')

buses = buses.map.with_index.to_a.reject { |bus| bus[0] == 'x' }.map { |bus| [bus[1], bus[0].to_i] }

earliest_align = 1
time_skip = 1

buses.each do |bus|
  while((earliest_align + bus[0]) % bus[1] != 0)
    earliest_align += time_skip
  end

  time_skip *= bus[1]
end

puts earliest_align