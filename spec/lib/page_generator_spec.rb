require './lib/page_generator'
require './lib/models/works'

describe PageGenerator do
  describe '#generate' do

    it 'asks each component generator to generate its pages' do
      component_generators = [
        double(Render::CameraMakeGenerator, generate: nil),
        double(Render::IndexGenerator, generate: nil),
      ]
      works = double(Models::Works)
      template_writer = double(Render::TemplateWriter)

      generator = PageGenerator.new(template_writer, component_generators)

      component_generators.each do |component_generators|
        expect(component_generators).to receive(:generate).once.with(works)
      end

      generator.generate(works)
    end

  end
end
