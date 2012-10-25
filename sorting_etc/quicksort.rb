def quicksort0(haystack)
  return haystack if haystack.size <= 1
  # randomly pick a pivot
  pivot = haystack.sample; haystack.delete(pivot)
  less = []; greater = []
  haystack.each do |elem|
    if elem <= pivot
      less << elem
    else
      greater << elem
    end
  end
  quicksort0(less) + [pivot] + quicksort0(greater)
end

a = [17, 9, 10, 24, 12]

puts quicksort0(a)