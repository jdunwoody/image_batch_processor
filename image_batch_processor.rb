#! /usr/bin/ruby

#encoding: utf-8

require './lib/parser'
require './lib/page_generator'

class ImageBatchProcessor

  def load(input_file)
    Parser.new(input_file).parse
  end

  def generate(output_dir, works)
    PageGenerator.new(output_dir).generate(works)
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