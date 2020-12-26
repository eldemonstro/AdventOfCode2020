# frozen_string_literal: true

require 'pry'

text = File.open(__dir__ + '/input.txt').read

input = text.split("\n")

def number_of_bags_inside(bag_map, main_bag)
  bag_map[main_bag].map do |bag|
    bag[:quantity] + (number_of_bags_inside(bag_map, bag[:bag]) * bag[:quantity])
  end.sum
end

bag_map = input.map do |bag|
  main_bag, nested_bags = bag.split('contain')
  inner_bags = nested_bags.gsub('.', '').split(',').map do |nested_bag|
    next nil if nested_bag.include? 'other bags'
    nested_bag.strip!
    {
      quantity: nested_bag[0].to_i,
      bag: nested_bag[2..].gsub(/[s]?$/, '')
    }
  end.compact
  [main_bag.strip.gsub(/[s]?$/, ''), inner_bags]
end.to_h

puts number_of_bags_inside(bag_map, 'shiny gold bag')
