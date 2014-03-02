#encoding: utf-8

require 'uri'

require './lib/presenters/presenter'

module PageGenerators
  class TemplateWriter

    def initialize(output_dir)
      @output_dir = output_dir
    end

    def write(template, name)
      File.open(File.join(@output_dir, name), 'w') do |f|
        f.write(template)
      end
    end

  end
end
