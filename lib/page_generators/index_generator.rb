require 'uri'
require './lib/presenters/presenter'

module PageGenerators
  class IndexGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      view = @presenter_factory.make_presenter

      view.title = 'Index'
      view.navigation_items = generate_navigation_items(works.camera_makes)
      view.thumbnail_urls = generate_thumbnail_items(works.thumbnails)
      template = view.render

      @template_writer.write(template, "index.html")
    end

    private

    def generate_thumbnail_items(thumbnails)
      # shouldn't need this
      thumbnail_urls = thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end
    end

    def generate_navigation_items(camera_makes)
      navigation_items = camera_makes.map do |camera_make|
        { url: "camera_make-#{URI.escape(camera_make.name)}.html", name: camera_make.name }
      end
    end

  end
end
