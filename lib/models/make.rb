#encoding: utf-8

require_relative 'model'

module Models
  class Make

    attr_accessor :thumbnails, :name, :models

    def initialize(name)
      @name = name.strip
      @thumbnails = []
      @models = []
    end

    def add_model(model_name, thumbnail)
      model = find_or_create_model(model_name)

      add_thumbnail(thumbnail)

      model.add_thumbnail(thumbnail)
      model
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
      @thumbnails << thumbnail.strip if more_thumbnails_required?
    end

    def name_matches?(name)
      @name.downcase == name.strip.downcase
    end

    def more_thumbnails_required?
      @thumbnails.size < 10
    end

  end
end
