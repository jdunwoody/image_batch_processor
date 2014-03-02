#encoding: utf-8

require 'uri'

require './lib/presenters/presenter'

module PageGenerators
  class CameraMakeGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      works.camera_makes.each do |camera_make|
        @template_writer.write(generate_camera_make(camera_make),
                               "camera_make-#{URI.escape(camera_make.name)}.html")
      end
    end

    private

    def generate_camera_make(camera_make)
      view = @presenter_factory.make_presenter

      view.title = camera_make.name
      view.navigation_items = generate_navigation_items(camera_make)
      view.thumbnail_urls = generate_thumbnail_urls(camera_make)

      view.render
    end

    def generate_navigation_items(camera_make)
      navigation_items = [{ url: "index.html", name: 'index' }]
      navigation_items += camera_make.models.map do |model|
        { url: "model-#{URI.escape(model.name)}.html", name: model.name }
      end

      navigation_items
    end

    def generate_thumbnail_urls(camera_make)
      # shouldn't need this
      camera_make.thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end
    end

  end
end
