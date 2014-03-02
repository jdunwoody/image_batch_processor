#! /usr/bin/ruby

require './lib/xml_parser'
require './lib/page_generator'
require 'pry'

class ImageBatchProcessor

  def load(input_file)
    XMLParser.new(input_file).parse
  end

  def generate(output_dir, works)
    template_writer = Render::TemplateWriter.new(output_dir)

    PageGenerator.new(template_writer).generate(works)
  end

end

input_file = ARGV[0]
output_dir = ARGV[1]

if !input_file || !output_dir
  puts "usage #{__FILE__} input_file output_dir"
  exit(1)
end

batch_processor = ImageBatchProcessor.new

works = batch_processor.load(input_file)

batch_processor.generate(output_dir, works)
