#encoding: utf-8

require 'uri'

require './lib/presenters/presenter'

module PageGenerators
  class IndexGenerator

    def initialize(template_writer)
      @template_writer = template_writer
    end

    def generate(works)
      navigation_items = works.camera_makes.map do |camera_make|
        { url: "camera_make-#{URI.escape(camera_make.name)}.html", name: camera_make.name }
      end

      # shouldn't need this
      thumbnail_urls = works.thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end

      view = Presenters::Presenter.new
      view.title = 'Index'
      view.navigation_items = navigation_items
      view.thumbnail_urls = thumbnail_urls
      template = view.render

      @template_writer.write(template, "index.html")
    end

  end
end
