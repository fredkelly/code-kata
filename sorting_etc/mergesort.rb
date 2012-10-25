def merge_sort(haystack)
  return haystack if haystack.size <= 1
  mid = haystack.size/2
  left = merge_sort(haystack[0..mid-1])
  right = merge_sort(haystack[mid..-1])
  merge(left, right)
end

def merge(left, right)
  result = []
  until left.empty? and right.empty?
    if !left.empty? and !right.empty?
      if left.first <= right.first
        result << left.shift
      else
        result << right.shift
      end
    elsif !left.empty?
      result << left.shift
    elsif !right.empty?
      result << right.shift
    end
  end
  result
end

a = [17, 9, 10, 24, 12]

puts merge_sort(a)