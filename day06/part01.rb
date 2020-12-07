# frozen_string_literal: true

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n\n")

result = input.reduce(0) do |acc, customs|
  acc + customs.gsub(/\s/, "").split("").uniq.count
end

puts result
