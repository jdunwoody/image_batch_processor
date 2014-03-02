require_relative 'presenter_factory'
require_relative 'url_helper'

module Render
  class CameraModelGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      works.models.each do |model|
        @template_writer.write(generate_model(model),
                               UrlHelper.camera_model_url(model.name))
      end
    end

    private

    def generate_model(model)
      view = @presenter_factory.make_presenter(model.name,
                                               generate_navigation_items(model),
                                               generate_thumbnail_urls(model))

      view.render
    end

    def generate_navigation_items(model)
      [
        { url: UrlHelper.index_url, name: 'index' },
        { url: UrlHelper.camera_make_url(model.camera_make.name), name: model.camera_make.name },
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
