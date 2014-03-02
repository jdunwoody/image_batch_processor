#require 'uri'
#require 'erb'
#require 'addressable'
require 'cgi'
require './lib/parse/text_transformer'

#http://stackoverflow.com/questions/2824126/whats-the-difference-between-uri-escape-and-cgi-escape

module Render
  class UrlHelper

    def self.camera_make_url(camera_make)
      normalised_name = Parse::TextTransformer.transform(camera_make.name)

      "camera-make-#{normalised_name}.html"
      #"camera_make-#{Addressable.parse(camera_make.name)}.html"
      #"camera-make-#{CGI.escape(normalised_name)}.html"
      #"camera_make-#{URI.escape(camera_make.name)}.html"
      #"camera_make-#{camera_make.name}.html"
      #"camera_make-#{ERB::Util.url_encode(camera_make.name)}.html"
    end

    def self.camera_model_url(camera_model)
      normalised_name = Parse::TextTransformer.transform(camera_model.name)

      "model-#{normalised_name}.html"
      #"model-#{URI.escape(camera_model.name)}.html"
      #"model-#{CGI.escape(normalised_name)}.html"
      #"model-#{ERB::Util.url_encode(camera_model.name)}.html"
      #"model-#{camera_model.name}.html"
    end

    def self.index_url
      "index.html"
    end

  end
end
