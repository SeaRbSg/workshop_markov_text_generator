require 'pismo'

module Datasets

  class Webpage < Text
    def initialize(url)
      page = Pismo::Document.new(url)
      super(page.body)
    end
  end
end
