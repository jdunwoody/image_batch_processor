require './lib/render/template_writer'
require './lib/render/camera_model_generator'
require './lib/render/camera_make_generator'
require './lib/render/index_generator'

class PageGenerator

  def initialize(template_writer, component_generators = nil)
    @component_generators = component_generators || [
      Render::CameraModelGenerator.new(template_writer),
      Render::CameraMakeGenerator.new(template_writer),
      Render::IndexGenerator.new(template_writer),
    ]
  end

  def generate(works)
    @component_generators.each do |component_generator|
      component_generator.generate(works)
    end
  end

end
