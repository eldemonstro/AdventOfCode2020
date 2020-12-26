# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

bag_map = input.map do |bag|
  main_bag, nested_bags = bag.split('contain')
  inner_bags = nested_bags.gsub('.', '').split(',').map do |nested_bag|
    return {} if nested_bag == 'no other bags'
    nested_bag.strip!
    {
      quantity: nested_bag[0].to_i,
      bag: nested_bag[2..].gsub(/[s]?$/, '')
    }
  end
  [main_bag.strip.gsub(/[s]?$/, ''), inner_bags]
end

old_bag_count = 0
accepted_bags = ['shiny gold bag']

while(old_bag_count != accepted_bags.count)
  old_bag_count = accepted_bags.count

  bag_map.each do |bag|
    accepted_bags << bag[0] if bag[1].any? { |x| accepted_bags.include?(x[:bag]) }
  end

  accepted_bags.uniq!
end

puts accepted_bags.count
