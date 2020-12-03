# frozen_string_literal: true

text = File.open(__dir__ + '/input.txt').read

input = text.lines.map(&:strip)

result = input.reduce(0) do |acc, value|
  password = %r((\d+)-(\d+)\s(.):\s(.+)).match(value).to_a
  acc += 1 if (password[4][password[1].to_i - 1] == password[3]) ^ (password[4][password[2].to_i - 1] == password[3])
  acc
end

puts result
