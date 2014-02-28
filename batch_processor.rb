#! /usr/bin/ruby

#encoding: utf-8

require './lib/works_xml_document'
require './lib/work'
require './lib/generator'

class BatchProcessor

  def load(input_file)
    xml_document = WorksXMLDocument.new
    parser = Nokogiri::XML::SAX::Parser.new(xml_document)

    parser.parse_file(input_file)

    xml_document.works
  end

  def generate(output_dir, works)
    puts Generator.new(output_dir).generate(works)
  end

end

input_file = ARGV[0]
output_dir = ARGV[1]

batch_processor = BatchProcessor.new

works = batch_processor.load(input_file)

batch_processor.generate(output_dir, works)

