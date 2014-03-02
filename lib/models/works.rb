require_relative 'camera_make'
require_relative 'thumbnails'

# normalise camera_makes
# repository?

module Models
  class Works

    attr_accessor :thumbnails
    attr_reader :camera_makes, :models

    def initialize
      @camera_makes = Set.new
      @models = Set.new
      @thumbnails = Thumbnails.new
    end

    def add(camera_make_name, model_name, thumbnail)
      @thumbnails.add(thumbnail)

      camera_make = find_or_create_camera_make(camera_make_name)

      @models << camera_make.add_model(model_name, thumbnail)
    end

    private

    def find_or_create_camera_make(camera_make_name)
      camera_make = @camera_makes.find do |camera_make|
        camera_make.name_matches?(camera_make_name)
      end

      if !camera_make
        camera_make = CameraMake.new(camera_make_name)
        @camera_makes << camera_make
      end

      camera_make
    end

  end
end
