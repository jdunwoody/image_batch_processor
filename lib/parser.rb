#encoding: utf-8

require './lib/parsers/works_xml_document'

class Parser
  def initialize(input_file)
    @input_file = input_file
  end

  def parse
    xml_document = WorksXMLDocument.new
    parser = Nokogiri::XML::SAX::Parser.new(xml_document)

    parser.parse_file(@input_file)

    xml_document.works
  end

end
