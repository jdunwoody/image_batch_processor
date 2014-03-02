require './lib/parse/text_transformer'

module Render
  class UrlHelper

    def self.camera_make_url(name)
      normalised_name = Parse::TextTransformer.transform(name)

      "camera-make-#{normalised_name}.html"
    end

    def self.camera_model_url(name)
      normalised_name = Parse::TextTransformer.transform(name)

      "model-#{normalised_name}.html"
    end

    def self.index_url
      "index.html"
    end

  end
end
