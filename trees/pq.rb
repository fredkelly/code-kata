class PriorityQueue
  def initialize
    @data = []
    @last = 0
  end
  
  def push(element)
    @data[@last+=1] = element
    upheap(@last)
  end
  
  def pop
    root = @data[1]
    @data[1] = @data[@last-=1]
    downheap(1)
    root
  end
  
  private
  
  def upheap(index)
    elem = @data[index]
    @data[0] = 0
    
    while (@data[index/2] > elem)
      @data[index] = @data[index/2]
      index /= 2
    end
    
    @data[index] = elem
  end
  
  def downheap(index)
    elem = @data[index]
    
    j = 0
    
    while(index <= @last/2)
      j = index*2
      
      j += 1 if j < @last and @data[j] > @data[j+1]
      break if elem <= @data[j]
      
      @data[index] = @data[j]
      index = j
    end
    
    @data[index] = elem
  end
end

q = PriorityQueue.new

for i in (1..50).to_a.shuffle
  puts "inserting #{i}.."
  q.push(i)
end

for i in 1..50
  puts "popped #{q.pop}"
end