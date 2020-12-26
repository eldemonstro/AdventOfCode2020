# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

needle = 0
needle_memory = []
acc = 0

while(!needle_memory.include?(needle))
  needle_memory << needle
  op, value = input[needle].split(/\s/)

  case op
  when 'jmp'
    needle += value.to_i
  when 'acc'
    acc += value.to_i
    needle += 1
  when 'nop'
    needle += 1
  end
end

puts acc
