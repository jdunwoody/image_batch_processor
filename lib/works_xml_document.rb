#encoding: utf-8

require 'nokogiri'
require 'pry'

require_relative 'works'

#
# Could be more robust to only extract make,model,url from one position. Currently will grab from anywhere in model.
# Less sensitive to schema changes
#

class WorksXMLDocument < Nokogiri::XML::SAX::Document

  attr_reader :works

  def initialize
    @works = Works.new
    @image_size = nil
    @text = ''
  end

  def start_element(name, attrs = [])
    @text = ''
    if name == 'url'
      @image_size = Hash[attrs]['type']
    end
  end

  def end_element(name)
    case name
    when 'work'
      @works.add(@make, @model, @thumbnail)

    when 'url'
      if @image_size == 'small'
        @thumbnail = @text
      end

    when 'make'
      @make = @text

    when 'model'
      @model = @text
    end
  end

  # multi line will call this multiple times. fix this
  def characters(string)
    @text << string
  end

end

#xml_document = WorksXMLDocument.new
#parser = Nokogiri::XML::SAX::Parser.new(xml_document)

#parser.parse(File.open(ARGV[0]))

#puts xml_document.works
