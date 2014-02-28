#! /usr/bin/ruby

#encoding: utf-8

require './lib/works_xml_document'
require './lib/work'

class BatchProcessor

  def load(input_file)
    xml_document = WorksXMLDocument.new
    parser = Nokogiri::XML::SAX::Parser.new(xml_document)

    parser.parse_file(input_file)

    xml_document.works
  end

end

input_file = ARGV[0]
output_file = ARGV[1]

BatchProcessor.new.load(input_file)
