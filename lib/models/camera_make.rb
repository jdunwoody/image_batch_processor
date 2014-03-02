require_relative 'camera_model'

module Models
  class CameraMake

    #include ActiveModel::Model

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

    def name_matches?(other_name)
      @name.downcase == other_name.strip.downcase
    end

    private

    def find_or_create_model(model_name)
      model = @models.find do |model|
        model.name_matches?(model_name)
      end

      if !model
        model = CameraModel.new(model_name, self)
        @models << model
      end

      model
    end

  end
end
