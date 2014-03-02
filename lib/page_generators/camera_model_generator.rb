#encoding: utf-8

require 'uri'

require './lib/presenters/presenter_factory'

module PageGenerators
  class CameraModelGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      works.models.each do |model|
        @template_writer.write(generate_model(model),
                               "model-#{URI.escape(model.name)}.html")
      end
    end

    private

    def generate_model(model)
      view = @presenter_factory.make_presenter

      view.title = model.name
      view.navigation_items = generate_navigation_items(model)
      view.thumbnail_urls = generate_thumbnail_urls(model)

      view.render
    end

    def generate_navigation_items(model)
      [
        { url: "index.html", name: 'index' },
        { url: "camera_make-#{URI.escape(model.camera_make.name)}.html", name: model.camera_make.name },
      ]
    end

    def generate_thumbnail_urls(model)
      # shouldn't need this
      model.thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end
    end

  end
end
