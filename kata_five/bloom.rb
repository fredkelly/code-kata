require 'digest/md5'

class Bloom
  def initialize(dict = '/usr/share/dict/words')
    @map = Array.new(1_000_000)
    IO.foreach(dict) do |word|
      insert word.chomp
    end
  end
  
  def hash(word)
    digest = Digest::MD5.hexdigest(word)
    digest.scan(/.{16}/).map { |chunk| chunk.to_i(16) % @map.size }
  end
  
  def insert(word)
    #puts "Inserting \"#{word}\" at positions #{hash(word).join(',')}"
    hash(word).each { |k| @map[k] = 1 }
  end
  
  def check(word)
    hash(word).collect{ |k| @map[k] || 0 }.join.to_i & 1 == 1
  end
  
  def usage
    "%.1f%% used" % (@map.count(1).to_f / @map.size.to_f)
  end
end

if __FILE__ == $0
  bloom = ARGV.first ? Bloom.new(ARGV.first) : Bloom.new
  puts bloom.check("freddykelly")
  puts bloom.check("zymotechnics")
  puts bloom.usage
end