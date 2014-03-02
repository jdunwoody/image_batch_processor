require 'cgi'

module Parse
  class TextTransformer

    def self.transform(input)
      transformed = input.gsub(/[^a-zA-Z0-9 ]/,'').strip
      transformed.gsub!(/ /,'-')
      CGI.escape(transformed)
    end

  end
end
