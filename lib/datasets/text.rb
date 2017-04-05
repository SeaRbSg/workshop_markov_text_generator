module Datasets

  class Text
    def initialize(text)
      @text = text
    end

    def words
      @words ||= begin
        w = {}
        @text.split(/\s+/).map(&:downcase).each do |word|
          w[word] ||= 0
          w[word] += 1
        end
        w
      end
    end
  end
end
