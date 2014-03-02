require 'uri'
require './lib/presenters/presenter'

module PageGenerators
  class IndexGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      @template_writer.write(generate_index(works), Presenters::UrlHelper.index_url)
    end

    private

    def generate_index(works)
      view = @presenter_factory.make_presenter('Index',
                                               generate_navigation_items(works.camera_makes),
                                               generate_thumbnail_items(works.thumbnails))
      view.render
    end

    def generate_thumbnail_items(thumbnails)
      thumbnail_urls = thumbnails.urls.map do |thumbnail|
        { url: thumbnail }
      end
    end

    def generate_navigation_items(camera_makes)
      camera_makes.map do |camera_make|
        { url: Presenters::UrlHelper.camera_make_url(camera_make), name: camera_make.name }
      end
    end

  end
end
