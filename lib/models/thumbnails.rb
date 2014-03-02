module Models
  class Thumbnails

    attr_accessor :urls

    def initialize
      @urls = Set.new
    end

    def add(thumbnail)
      @urls << thumbnail.strip if more_thumbnails_required?
    end

    private

    def more_thumbnails_required?
      @urls.size < 10
    end

  end
end
