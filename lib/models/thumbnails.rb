module Models
  class Thumbnails

    attr_accessor :urls

    def initialize
      @urls = Set.new
    end

    def add(thumbnail)
      @urls << thumbnail.strip if more_thumbnails_accepted?
    end

    def to_s
      urls.count.to_s
    end

    private

    def more_thumbnails_accepted?
      @urls.size < 10
    end

  end
end
