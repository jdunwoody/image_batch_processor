#encoding: utf-8

require 'uri'

require './lib/presenters/presenter'

module PageGenerators
  class CameraModelGenerator

    def initialize(template_writer)
      @template_writer = template_writer
    end

    def generate(works)
      works.models.each do |model|
        generate_model(model)
      end
    end

    private

    def generate_model(model)
      navigation_items = [
        { url: "index.html", name: 'index' },
        { url: "camera_make-#{URI.escape(model.camera_make.name)}.html", name: model.camera_make.name },
      ]

      # shouldn't need this
      thumbnail_urls = model.thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end

      view = Presenters::Presenter.new
      view.title = model.name
      view.navigation_items = navigation_items
      view.thumbnail_urls = thumbnail_urls
      template = view.render

      @template_writer.write(template, "model-#{URI.escape(model.name)}.html")
    end

  end
end
