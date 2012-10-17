def gcd0(a, b)
  return a if a == b
  min, max = [a, b].sort
  gcd0(max - min, min)
end

def gcd1(a, b)
  if b == 0
    a
  else
    gcd1(b, a % b)
  end
end

puts gcd0(1989, 867)
puts gcd1(1989, 867)