#encoding: utf-8

require_relative 'thumbnails'

module Models
  class Model

    attr_accessor :thumbnails, :name, :camera_make

    def initialize(name, camera_make)
      @name = name.strip
      @thumbnails = Thumbnails.new
      @camera_make = camera_make
    end

    def name_matches?(name)
      @name == name.strip
    end

  end
end
