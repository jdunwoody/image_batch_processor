require './lib/xml_parsers/works_xml_document'

class XMLParser
  def initialize(input_file)
    @input_file = input_file
  end

  def parse
    xml_document = XMLParsers::WorksDocument.new
    parser = Nokogiri::XML::SAX::Parser.new(xml_document)

    parser.parse_file(@input_file)

    xml_document.works
  end

end
