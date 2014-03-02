
module Render
  class TemplateWriter

    def initialize(output_dir)
      @output_dir = output_dir
      FileUtils.mkdir_p(output_dir)
    end

    def write(template, name)
      File.open(File.join(@output_dir, name), 'w') do |f|
        f.write(template)
      end
    end

  end
end
