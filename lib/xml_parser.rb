require './lib/parse/works_document'
require './lib/parse/parser_factory'

class XMLParser

  def initialize(input_file, parser_factory = Parse::ParserFactory.new)
    @input_file = input_file
    @parser_factory = parser_factory
  end

  def parse
    xml_document = Parse::WorksDocument.new
    parser_impl = @parser_factory.make(xml_document)

    parser_impl.parse_file(@input_file)

    xml_document.works
  end

end
