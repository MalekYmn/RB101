arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

a = arr.map do |hsh|
  incremented_hsh = {}
  hsh.each_key do |k|
    incremented_hsh[k] = hsh[k] + 1
  end
  incremented_hsh
end

p a
p arr
