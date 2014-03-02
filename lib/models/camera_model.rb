require_relative 'thumbnails'

module Models
  class CameraModel

    attr_accessor :thumbnails, :name, :camera_make

    def initialize(name, camera_make)
      @name = name.strip
      @thumbnails = Thumbnails.new
      @camera_make = camera_make
    end

    def name_matches?(name)
      @name.downcase == name.strip.downcase
    end

  end
end
