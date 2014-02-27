#! /usr/bin/ruby

require 'nokogiri'
#require 'pry'

class MyDoc < Nokogiri::XML::SAX::Document

  attr_reader :works

  def initialize
    works = []
  end

  def start_element(name, attrs = [])

    case name
    when 'url'
      text = ''
      attrs['small']
    when 'make'
      text = ''
    when 'model'
      text = ''
    end
  end

  def end_element(name)
    case name
    when 'work'
      works << Work.new(url: url, make: make, model: model)

    when 'url'
      url = text if attrs['small']

    when 'make'
      make = text

    when 'model'
      model = text

    end
  end

  def characters(string)
    text << string
  end

  private

  attr_writer :works

  attr_accessor :text

end

my_doc = MyDoc.new
parser = Nokogiri::XML::SAX::Parser.new(my_doc)

parser.parse(File.open(ARGV[0]))

puts my_doc.works
