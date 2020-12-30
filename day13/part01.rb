# frozen_string_literal: true

require 'amazing_print'
require 'pry'

text = File.open(__dir__ + '/input.txt').read

earliest_depart, buses = text.split("\n")

earliest_depart = earliest_depart.to_i
buses = buses.split(',').reject { |bus| bus == 'x' }.map(&:to_i)

next_buses = buses.map { |bus| [bus, ((earliest_depart.to_f / bus.to_f).ceil * bus)] }.to_h

next_bus =  next_buses.min { |a, b| a[1] <=> b[1] }

ap next_bus[0] * (next_bus[1] - earliest_depart)