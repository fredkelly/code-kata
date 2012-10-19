require 'benchmark'

# crappy first go
def search0(needle, haystack)
  mid = haystack.size/2
  
  if haystack[mid].nil?
    return false
  elsif haystack[mid] == needle
    return true
  elsif haystack[mid] < needle
    return search0(needle, haystack[mid+1..-1])
  elsif haystack[mid] > needle
    return search0(needle, haystack[0..mid-1])
  end
end

# recursive option
def search1(needle, haystack, min = 0, max = haystack.size-1)
  return false if max < min
  mid = (min + max) / 2
  if haystack[mid] < needle
    return search1(needle, haystack, mid+1, max)
  elsif haystack[mid] > needle
    return search1(needle, haystack, min, mid-1)
  else
    return mid
  end
end

# iterative option
def search2(needle, haystack)
  min, max = 0, haystack.size-1
  
  while (max >= min)
    mid = (min + max) / 2
    if haystack[mid] < needle
      min = mid + 1
    elsif haystack[mid] > needle
      max = mid - 1
    else
      return mid
    end
  end
  
  return false
end

a = (1..100).to_a

Benchmark.bm(15) do |x|
  x.report("Proof:")      { search0(ARGV.first.to_i, a) }
  x.report("Recursive:")  { search1(ARGV.first.to_i, a) }
  x.report("Iterative:")  { search2(ARGV.first.to_i, a) }
end