arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

a = arr.map do |sub_arr|
  sub_arr.select do |integer|
    integer % 3 == 0
  end
end

p a
