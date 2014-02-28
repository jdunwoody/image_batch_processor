#encoding: utf-8

require_relative 'model'

module Models
  class CameraMake

    attr_accessor :thumbnails, :name, :models

    def initialize(name)
      @name = name.strip
      @thumbnails = Thumbnails.new
      @models = []
    end

    def add_model(model_name, thumbnail)
      model = find_or_create_model(model_name)

      @thumbnails.add(thumbnail)

      model.thumbnails.add(thumbnail)
      model
    end

    def name_matches?(name)
      @name.downcase == name.strip.downcase
    end

    private

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

  end
end
