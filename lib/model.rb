#encoding: utf-8

class Model

  attr_accessor :thumbnails, :name, :make

  def initialize(name, make)
    @name = name.strip.downcase
    @thumbnails = []
    @make = make
  end

  #def add_model(model_name, thumbnail)
    #model = find_or_create_model(model_name)

    #add_thumbnail(thumbnail)
  #end

  #private

  #def find_or_create_model(model_name)
    #model = @models.find do |model|
      #model.name_matches?(model_name)
    #end

    #if !model
      #model = Model.new(model_name)
      #@models << model
    #end

    #model
  #end

  def add_thumbnail(thumbnail)
    @thumbnails << thumbnail
  end

  def name_matches?(name)
    @name == name.strip.downcase
  end

end
