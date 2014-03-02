require './lib/xml_parsers/works_xml_document'

class XMLParser

  def initialize(input_file, parser_factory)
    @input_file = input_file
    @parser_factory = parser_factory
  end

  def parse
    xml_document = XMLParsers::WorksDocument.new
    parser_impl = @parser_factory.make(xml_document)

    parser_impl.parse_file(@input_file)

    xml_document.works
  end

end
