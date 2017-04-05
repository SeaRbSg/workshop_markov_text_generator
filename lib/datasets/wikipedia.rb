
module Datasets

  class Wikipedia < Webpage

    def initialize(article)
      super("https://en.wikipedia.org/wiki/#{article}");
    end

  end

end
