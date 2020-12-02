# frozen_string_literal: true

require 'benchmark'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n").map { |string| string.to_i }

Benchmark.bm do |x|
  x.report("Live code") do
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
  end

  x.report("Post Live Code") do
    permut = input.permutation(2)
    puts permut.reduce(0) { |acc, value| input.include?(2020 - value.sum) ? (2020 - value.sum) * value.inject(:*) : acc }
  end
end

