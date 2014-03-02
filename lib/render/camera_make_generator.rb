require './lib/render/presenter'
require './lib/render/url_helper'

module Render
  class CameraMakeGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      works.camera_makes.each do |camera_make|
        @template_writer.write(generate_camera_make(camera_make),
                               UrlHelper.camera_make_url(camera_make.name))
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
      navigation_items = [{ url: UrlHelper.index_url, name: 'index' }]
      navigation_items += camera_make.models.map do |model|
        { url: UrlHelper.camera_model_url(model.name), name: model.name }
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
