def sqrt_0(n)
  square = 1.0
  delta = 3.0
  while square <= n
    square += delta
    delta += 2.0
  end
  delta/2.0 - 1.0
end

def sqrt_1(n)
  fa = n/2.0
  sa = n/fa
  ta = (fa + sa) / 2.0
  
  while (n - ta**2).abs > 0.000000001
    fa = ta
    sa = n/fa
    ta = (fa + sa) / 2.0
  end
  
  ta
end

def multiply(a, b)
  ca = to_i_a(a)
  cb = to_i_a(b)
  n = ca.size + cb.size + 1
  
  result = Array.new(n, 0)
  line = Array.new(n, 0)
  
  for i in 0..cb.size-1
    residue = 0
    
    for k in 0..ca.size-1
      digit = cb[cb.size-1-i] * ca[ca.size-1-k] + residue
      residue = digit/10
      digit = digit%10
      
      line[k+i] = digit
    end
    
    line[ca.size+i] = residue
    
    residue = 0
    for k in 0..result.size-1
      digit = result[k] + line[k] + residue
      residue = digit/10
      digit = digit%10
      
      result[k] = digit
    end
  end
  
  final = ''
  matter = false
  
  for i in 0..result.size-1
    if matter || result[result.size-1-i] > 0
      final += result[result.size-1-i].to_s
      matter = true
    end
  end
  
  final
end

# to int array
def to_i_a(i)
  i.scan(/.{1}/).map!(&:to_i)
end

puts Math.sqrt(34534)
puts sqrt_0(34534)
puts sqrt_1(34534)
puts 746 * 245
puts multiply('746', '245')