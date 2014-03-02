require 'erb'
#require 'cgi'
#require 'addressable'

#http://stackoverflow.com/questions/2824126/whats-the-difference-between-uri-escape-and-cgi-escape

module Presenters
  class UrlHelper

    def self.camera_make_url(camera_make)
      #"camera_make-#{Addressable.parse(camera_make.name)}.html"
      #"camera_make-#{CGI.escape(camera_make.name)}.html"
      "camera_make-#{ERB::Util.url_encode(camera_make.name)}.html"
    end

    def self.camera_model_url(camera_model)
      #"model-#{CGI.escape(camera_model.name)}.html"
      "model-#{ERB::Util.url_encode(camera_model.name)}.html"
    end

    def self.index_url
      "index.html"
    end

  end
end
