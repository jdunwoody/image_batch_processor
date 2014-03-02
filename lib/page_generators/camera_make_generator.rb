require './lib/presenters/presenter'
require './lib/presenters/url_helper'

module PageGenerators
  class CameraMakeGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      works.camera_makes.each do |camera_make|
        @template_writer.write(generate_camera_make(camera_make),
                               Presenters::UrlHelper.camera_make_url(camera_make))
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
      navigation_items = [{ url: Presenters::UrlHelper.index_url, name: 'index' }]
      navigation_items += camera_make.models.map do |model|
        { url: Presenters::UrlHelper.camera_model_url(model), name: model.name }
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
