# frozen_string_literal: true

require 'benchmark'

text = File.open(__dir__ + '/input.txt').read

input = text.lines.map(&:strip)

Benchmark.bm do |x|
  x.report("First awnser:") do
    result = input.reduce(0) do |acc, value|
      password = %r((\d+)-(\d+)\s(.):\s(.+)).match(value).to_a
      password[4] = password[4].gsub(/[^#{password[3]}]/, '')
      acc += 1 if password[4].length.between?(password[1].to_i, password[2].to_i)
      acc
    end

    puts result
  end

  x.report("New awnser:") do
    result = input.map do |value|
      password = %r((\d+)-(\d+)\s(.):\s(.+)).match(value).to_a
      (password[1].to_i..password[2].to_i).include?(password[4].count(password[3]))
    end

    puts result.count(true)
  end
end


