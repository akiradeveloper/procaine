def func(x, y, z)
  x * y * z
end

if __FILE__ == $0
  puts func(1,2,3)
  puts func(*[1,2,3])
end
