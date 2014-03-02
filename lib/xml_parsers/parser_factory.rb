module XMLParsers
  class ParserFactory

    def make(xml_document)
      Nokogiri::XML::SAX::Parser.new(xml_document)
    end

  end
end
