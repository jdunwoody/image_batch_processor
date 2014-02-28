#encoding: utf-8

require_relative 'model'

class Make

  attr_accessor :thumbnails, :name, :models

  def initialize(name)
    @name = name.strip.downcase
    @thumbnails = []
    @models = []
  end

  def add_model(model_name, thumbnail)
    model = find_or_create_model(model_name)

    add_thumbnail(thumbnail)
  end

  #private

  def find_or_create_model(model_name)
    model = @models.find do |model|
      model.name_matches?(model_name)
    end

    if !model
      model = Model.new(model_name, self)
      @models << model
    end

    model
  end

  def add_thumbnail(thumbnail)
    @thumbnails << thumbnail
  end

  def name_matches?(name)
    @name == name.strip.downcase
  end

end
