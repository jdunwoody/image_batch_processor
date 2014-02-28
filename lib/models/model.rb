#encoding: utf-8

module Models
  class Model

    attr_accessor :thumbnails, :name, :camera_make

    def initialize(name, camera_make)
      @name = name.strip
      @thumbnails = []
      @camera_make = camera_make
    end

    def add_thumbnail(thumbnail)
      @thumbnails << thumbnail.strip if more_thumbnails_required?
    end

    def name_matches?(name)
      @name == name.strip
    end

    def more_thumbnails_required?
      @thumbnails.size < 10
    end

  end
end
