require 'nokogiri'
require './lib/models/works'

#
# Could be more robust to only extract camera_make,model,url from one position. Currently will grab from anywhere in model.
# This solution is less sensitive to schema changes
#

module Parse
  class WorksDocument < Nokogiri::XML::SAX::Document

    attr_reader :works

    def initialize
      @works = Models::Works.new
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
        @works.add(@camera_make, @model, @thumbnail) if @camera_make && @model && @thumbnail

      when 'url'
        if @image_size == 'small'
          @thumbnail = @text
        end

      when 'make'
        @camera_make = @text

      when 'model'
        @model = @text
      end
    end

    def characters(string)
      @text << string
    end

  end
end
