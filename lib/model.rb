#encoding: utf-8

class Model

  attr_accessor :thumbnails, :name, :make

  def initialize(name, make)
    @name = name.strip.downcase
    @thumbnails = []
    @make = make
  end

  def add_thumbnail(thumbnail)
    @thumbnails << thumbnail.strip.downcase if more_thumbnails_required?
  end

  def name_matches?(name)
    @name == name.strip.downcase
  end

  def more_thumbnails_required?
    @thumbnails.size < 10
  end

end
