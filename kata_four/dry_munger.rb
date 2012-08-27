class Munger
  def initialize(path=nil)
    raise ArgumentError, 'Please provide a target .dat file.' if path.nil?
    data = IO.read(path) # read the contents of the file
    # split out the data segment into an array of lines
    @lines = data[%r{<pre>([^<]+)</pre>}].gsub(/-+\n|(^$\s)/, '').split("\n")
    @lines.reject! { |line| line.size < (@lines.join.size/@lines.size)/10  }
  end
  
  def value_at(row, col)
    data[row][labels.index(col)]
  end
  
  def size
    data.size
  end
  
  private #---------------------------------------------------------------------------
  
  def data
    @data ||= Hash[@lines[2..-2].map(&:split).map{ |row| [row.first.to_i, row[1..-1]] }]
  end
  
  def labels
    @labels ||= @lines[1].split.map { |label| label.downcase.to_sym }
  end
end

if __FILE__ == $0
  munger = Munger.new(ARGV.first)
  puts munger.value_at(16,:w)
end