require './lib/generator'

describe Generator do
  describe '#generate' do

    let(:generator) { Generator.new }

    it 'makes an empty template for 0 works' do
      works = []
      generator.generate(works)
    end

  end
end
