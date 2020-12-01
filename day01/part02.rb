# frozen_string_literal: true

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n").map { |string| string.to_i }

valueX = 0
valueY = 0
valueZ = 0

input.each do |x|
  input.each do |y|
    input.each do |z|
      if x + y + z == 2020
        valueX = x
        valueY = y
        valueZ = z
      end
    end
  end
end

puts valueX * valueY * valueZ
