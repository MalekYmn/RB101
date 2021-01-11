array = [2, 5, 3, 4, 1]

p array.sort

array = array.sort do |a, b|
  b <=> a
end

p array

[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end

ary = ['cot', 'bedroom', 'aat bat'].sort_by do |w|
  w.length
end

p ary
