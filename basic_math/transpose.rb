require 'matrix'

# assumes n x n matrix!
def transpose(matrix)
  n = matrix.size
  new = Array.new(n) { Array.new }
  for i in 0..n-1
    for j in 0..n-1
      new[j][i] = matrix[i][j]
    end
  end
  new
end

m = Matrix[[1,2,7], [3,4,1], [5,6,9]]

puts m.transpose
puts Matrix[*transpose(m.to_a)]
