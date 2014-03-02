module Parse
  class TextTransformer

    def self.transform(input)
      alphbet_chars = input.gsub(/[^a-zA-Z0-9 ]/,'')
      alphbet_chars.gsub(/ /,'-')
    end

  end
end
