require './lib/xml_parser'
require './lib/parse/parser_factory'

describe XMLParser do
  describe '#parse' do

    let(:input_file) { double('Input File') }
    let(:parser_impl) { double('Parser Implementation', parse_file: nil) }
    let(:parser_factory) { double(Parse::ParserFactory, make: parser_impl) }
    let(:parser) { XMLParser.new(input_file, parser_factory) }

    it 'asks the parser to parse the file' do
      expect(parser_impl).to receive(:parse_file).once.with(input_file)

      parser.parse
    end

  end
end
