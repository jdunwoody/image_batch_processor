#encoding: utf-8

require './lib/page_generators/template_writer'
require './lib/page_generators/camera_model_generator'
require './lib/page_generators/camara_make_generator'
require './lib/page_generators/index_generator'

class PageGenerator

  def initialize(output_dir, template_writer = nil, component_generators = [])

    @template_writer = PageGenerators::TemplateWriter.new(output_dir)

    @component_generators = [
      PageGenerators::CameraModelGenerator.new(@template_writer),
      PageGenerators::CameraMakeGenerator.new(@template_writer),
      PageGenerators::IndexGenerator.new(@template_writer),
    ]
  end

  def generate(works)
    @component_generators.each do |component_generator|
      component_generator.generate(works)
    end
  end

end
