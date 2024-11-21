#!/usr/bin/env ruby

inputs = File.read('input').chomp.chars
total = 0
inputs.each do |input|
  total += case input
  when 'A'
    0
  when 'B'
    1
  when 'C'
    3
  end
end

puts total


inputs2 = File.read('input2').chomp.chars

# take two a time and see what add a total based on their values
total = 0
inputs2.each_slice(2) do |input|
  total += case input
    when ['A', 'x'], ['x', 'A']
      0
    when ['B', 'x'], ['x', 'B']
      1
    when ['A', 'A']
      2
    when ['C', 'x'], ['x', 'C'], ['A', 'B'], ['B', 'A']
      3
    when ['B', 'B']
      4
    when ['x', 'D'], ['D', 'x'], ['C', 'A'], ['A', 'C']
      5
    when ['B', 'C'], ['C', 'B']
      6
    when ['A', 'D'], ['D', 'A']
      7
    when ['B', 'D'], ['D', 'B'], ['C', 'C']
      8
    when ['C', 'D'], ['D', 'C']
      10
    when ['D', 'D']
      12
    when ['x', 'x']
      0
    else
      puts input
    end
end

puts total

inputs3 = File.read('input3').chomp.chars

total = 0
inputs3.each_slice(3) do |input|
  bonus = input.count('x') < 2 ? (input.count('x') == 0 ? 6 : 2 ) : 0

  total += bonus
  total += input.count('B')
  total += input.count('C') * 3
  total += input.count('D') * 5
end

puts total
