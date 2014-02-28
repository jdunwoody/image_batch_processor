#encoding: utf-8

require_relative 'make'

# normalise makes
# repository?

class Works

  attr_accessor :thumbnails
  attr_reader :makes, :models

  def initialize
    @makes = Set.new
    @models = Set.new
    @thumbnails = []
  end

  def add(make_name, model_name, thumbnail)
    make = find_or_create_make(make_name)

    add_thumbnail(thumbnail)

    @models << make.add_model(model_name, thumbnail)
  end

  # private

  def find_or_create_make(make_name)
    make = @makes.find do |make|
      make.name_matches?(make_name)
    end

    if !make
      make = Make.new(make_name)
      @makes << make
    end

    make
  end

  def add_thumbnail(thumbnail)
    @thumbnails << thumbnail.strip.downcase if more_thumbnails_required?
  end

  def more_thumbnails_required?
    @thumbnails.size < 10
  end

end
