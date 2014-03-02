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
      view = @presenter_factory.make_presenter(camera_make.name,
                                               generate_navigation_items(camera_make),
                                               generate_thumbnail_urls(camera_make.thumbnails))

      view.render
    end

    def generate_navigation_items(camera_make)
      navigation_items = [{ url: "index.html", name: 'index' }]
      navigation_items += camera_make.models.map do |model|
        { url: "model-#{URI.escape(model.name)}.html", name: model.name }
      end

      navigation_items
    end

    def generate_thumbnail_urls(thumbnails)
      thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end
    end

  end
end
