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
                               Presenters::UrlHelper.camera_model_url(model))
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
        { url: Presenters::UrlHelper.index_url, name: 'index' },
        { url: Presenters::UrlHelper.camera_make_url(model.camera_make), name: model.camera_make.name },
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
