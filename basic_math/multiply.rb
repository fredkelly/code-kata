$result = nil

def multiply(a,b)
  $result = Array.new(a.size+b.size, 0)
  
  # least significant first
  a.reverse!; b.reverse!
  
  value = 0
  for i in 0..a.size-1
    for j in 0..b.size-1
      value = a[i].to_i * b[j].to_i
      insert(i+j, value)
      #if (value + $result[i+j]) < 10
      #  $result[i+j] += value
      #else
      #  $result[i+j] += value % 10
      #  puts $result[i+j+1] += value / 10
      #end
    end
  end
  
  $result.reverse.join(',')
end

def insert(index, value)
  if (value + $result[index]) < 10
    $result[index] += value
  else
    if $result[index] + value % 10 < 10
      $result[index] += value % 10
      insert(index + 1, value / 10)
    else
      
      
      carry = ($result[index] + value % 10) / 10
      $result[index] = ($result[index] + value % 10) % 10
      
      
      insert(index + 1, carry)
    end
  end
end

puts 307*9263
puts multiply('307', '9263')