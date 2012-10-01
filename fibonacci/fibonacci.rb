def fib_0(n)
  if n < 2
    n
  else
    fib_0(n-1) + fib_0(n-2)
  end
end

def fib_1(n)
  return n if n < 2
  vals = [0, 1]
  (n-1).times do 
    vals.push(vals[-1] + vals[-2]) 
  end
  return vals.last
end

root_5 = Math.sqrt(5)
$omega = (1.0 + root_5) / 2.0
$psi   = (1.0 - root_5) / 2.0

def fib_2(n)
  (($omega**n - $psi**n) / ($omega - $psi)).floor
end

def time_method(method, *args)
  start = Time.now
  result = self.send(method, *args)
  finish = Time.now
  puts "(#{method}) Time elapsed #{(finish - start)*1000} m/s"
  result
end

puts "Starting the great Fibonacci test...\n===================================="
puts time_method(:fib_0, 20)
puts time_method(:fib_1, 100)
puts time_method(:fib_2, 100)