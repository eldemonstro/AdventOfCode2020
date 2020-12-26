# frozen_string_literal: true

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

def run_program(program)
  needle = 0
  needle_memory = []
  acc = 0

  while(!needle_memory.include?(needle))
    needle_memory << needle
    op, value = program[needle].split(/\s/)

    case op
    when 'jmp'
      needle += value.to_i
    when 'acc'
      acc += value.to_i
      needle += 1
    when 'nop'
      needle += 1
    end

    if needle >= program.count
      raise "#{acc}"
    end
  end

  return acc
end

input.count.times do |iteration|
  next if input[iteration].include?('acc')

  program = input.dup

  program[iteration] = program[iteration].gsub(/(nop|jmp)/) { |word| word == "nop" ? "jmp" : "nop" }

  run_program(program)
rescue => e
  puts e

  break
end

