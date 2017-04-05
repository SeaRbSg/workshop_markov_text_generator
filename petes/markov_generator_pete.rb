class MarkovGenerator
  def self.from_file file
    from_text File.read(file)
  end

  def self.from_text text
    freq_hash = Hash.new {|hash, key| hash[key] = [] }

    text.split.each_cons(2) do |word, following_word|
      freq_hash[word] << following_word
    end


    require 'pp'
    pp freq_hash
    current_word = freq_hash.keys.sample
    sentence = [current_word]

    12.times do
      p current_word
      current_word = freq_hash[current_word].sample
      sentence << current_word
    end

    sentence.join(" ")
  end
end
