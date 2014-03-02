require './lib/page_generators/template_writer'
require './lib/page_generators/camera_model_generator'
require './lib/page_generators/camera_make_generator'
require './lib/page_generators/index_generator'

class PageGenerator

  def initialize(template_writer, component_generators = nil)
    @component_generators = component_generators || [
      PageGenerators::CameraModelGenerator.new(template_writer),
      PageGenerators::CameraMakeGenerator.new(template_writer),
      PageGenerators::IndexGenerator.new(template_writer),
    ]
  end

  def generate(works)
    @component_generators.each do |component_generator|
      component_generator.generate(works)
    end
  end

end
