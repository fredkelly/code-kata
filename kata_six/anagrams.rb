class Anagrams
  def initialize(words)
    @words ||= {}
    IO.foreach(words) do |word|
      word.chomp!.downcase!
      @words[key = word.chars.sort.join] = Array(@words[key]) << word
    end
  end
  
  def matched
    @words.select{|k,v| v.size > 1}
  end
end

if __FILE__ == $0
  anagrams = Anagrams.new(ARGV.first)
  puts anagrams.matched.map{|a| a.join(',')}
end