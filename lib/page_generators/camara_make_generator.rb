#encoding: utf-8

require 'uri'

require './lib/presenters/presenter'

module PageGenerators
  class CameraMakeGenerator

    def initialize(template_writer)
      @template_writer = template_writer
    end

    def generate(works)
      works.camera_makes.each do |camera_make|
        generate_camera_make(camera_make)
      end
    end

    private

    def generate_camera_make(camera_make)
      navigation_items = [{ url: "index.html", name: 'index' }]
      navigation_items += camera_make.models.map do |model|
        { url: "model-#{URI.escape(model.name)}.html", name: model.name }
      end

      # shouldn't need this
      thumbnail_urls = camera_make.thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end

      view = Presenters::Presenter.new
      view.title = camera_make.name
      view.navigation_items = navigation_items
      view.thumbnail_urls = thumbnail_urls
      template = view.render

      @template_writer.write(template, "camera_make-#{URI.escape(camera_make.name)}.html")
    end

  end
end
