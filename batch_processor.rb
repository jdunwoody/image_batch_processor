#! /usr/bin/ruby

#encoding: utf-8

require './lib/parser'
require './lib/generator'

class BatchProcessor

  def load(input_file)
    Parser.new(input_file).parse
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

