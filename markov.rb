require 'pp'
class Markov
  attr_accessor :source_text, :hash

  def initialize(file)
    @source_text = File.read(file)
    parse_source
    build_frequency_hash
  end

  def output(length = 12)
    @some_word = @hash.to_a.sample(1)[0][0]
    @output = @some_word
    @capitalize = false
    @length = 0
    length.times do
      core_loop
    end
    core_loop until @output[-1] == '.' || @length > length + 100
    @output[0] = @output[0].upcase
    @output = @output + '.' unless @output[-1] == '.'
    @output.gsub!(/[)(]/, '')
    @output
  end

  def core_loop
    @length += 1
    @capitalize = true if @some_word[-1] == '.'
    @capitalize = true if @some_word[-2] == '.'
    @some_word = @hash[@some_word].sample(1)[0] || '.'

    if @capitalize
      @some_word.capitalize!
      @capitalize = false
    end
    @output += ' ' unless @output[-1] == ' '
    @output += @some_word
  end

  def parse_source
    @words = @source_text.split(/[ \n]/)
  end

  def build_frequency_hash
    @hash = {}
    @words.each_cons(2) do |two_words|
      next unless two_words.length == 2
      if !@hash[two_words[0]]
        @hash[two_words[0]] = [two_words[1]]
      else
        @hash[two_words[0]] << two_words[1]
      end
    end
  end
end
