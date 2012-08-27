class Anagrams
  def initialize(words)
    @words ||= {}
    IO.foreach(words) do |word|
      word = word.chop.downcase
      @words[key = self.class.sort_string(word)] = Array(@words[key]) << word
    end
  end
  
  def found
    @words.select{|k,v| v.size > 1}
  end
  
  private
  
  def self.sort_string(string)
    string.chars.sort.join
  end
end

if __FILE__ == $0
  anagrams = Anagrams.new(ARGV.first)
  puts anagrams.found.map{|a| a.join(',')}
end