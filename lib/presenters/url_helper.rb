require 'uri'

module Presenters
  class UrlHelper

    def self.camera_make_url(camera_make)
      "camera_make-#{URI.escape(camera_make.name)}.html"
    end

    def self.camera_model_url(camera_model)
      "model-#{URI.escape(camera_model.name)}.html"
    end

    def self.index_url
      "index.html"
    end
  end
end
