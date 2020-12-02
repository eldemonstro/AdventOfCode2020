# frozen_string_literal: true

require 'benchmark'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n").map { |string| string.to_i }

Benchmark.bm do |x|
  x.report("Live code") do
    valueX = 0
    valueY = 0

    input.each do |x|
      input.each do |y|
        if x + y == 2020
          valueX = x
          valueY = y
        end
      end
    end

    puts valueX * valueY
  end

  x.report("Post Live Code") do
    puts input.reduce(0) { |acc, value| input.include?(2020 - value) ? (2020 - value) * value : acc }
  end
end
