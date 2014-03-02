require './lib/page_generator'

describe PageGenerator do
  describe '#generate' do

    it 'makes an empty template for 0 works' do
      component_generators = [
        double(PageGenerators::CameraMakeGenerator, generate: 'OUTPUT'),
        double(PageGenerators::IndexGenerator, generate: 'OUTPUT'),
      ]

      generator = PageGenerator.new('OUTPUT PATH', component_generators)

      component_generators.each do |component_generators|
        expect(component_generators).to receive(:generate).once.with(nil)
      end

      generator.generate(nil)

    end

  end
end
