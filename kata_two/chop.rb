class Kata
  
  # the ruby builtin
  def self.chop_ruby(needle, haystack)
    haystack.index(needle) || -1
  end
  
  # Most simple iterative example.
  def self.chop_one(needle, haystack)
    haystack.each_with_index do |val, index|
      return index if val == needle
    end
    return -1
  end
  
  # Binary search method
  #def self.chop_two(needle, haystack)
  #  pivot = haystack.size/2
  #  # base
  #  if haystack[pivot] == needle
  #    return pivot
  #  # lower half
  #  elsif haystack[pivot] > needle
  #    return chop_two(needle, haystack[0..pivot-1])
  #  # upper half
  #  elsif haystack[pivot] < needle
  #    return chop_two(needle, haystack[pivot+1..-1])
  #  else
  #    return -1
  #  end
  #end
  
  def self.chop_two(needle, haystack, min = 0, max = haystack.size)
    if haystack[min] != needle && max <= min
      return -1
    else
      mid = (min + max) / 2
      # lower half
      if haystack[mid] > needle
        return chop_two(needle, haystack, min, mid - 1)
      # upper half
      elsif haystack[mid] < needle
        return chop_two(needle, haystack, mid + 1, max)
      # found!
      else
        return mid
      end
    end
  end
  
  # add to a hash, no faster than linear
  # however more efficient for multiple lookups.
  def self.chop_three(needle, haystack)
    @hash = {}
    haystack.each_with_index do |val, index|
      @hash[val] = index
    end
    return @hash[needle] || -1
  end
  
  # iterative binary search
  # does not work with missing values?
  def self.chop_four(needle, haystack)
    min = 0; max = haystack.size
    while min < max
      mid = (min + max) / 2
      # lower half
      if haystack[mid] > needle
        max = mid - 1
      # upper half
      elsif haystack[mid] < needle
        min = mid + 1
      # found!
      else
        return mid
      end
    end
    return -1
  end
  
  class << self
    alias_method :chop, :chop_three
  end
end