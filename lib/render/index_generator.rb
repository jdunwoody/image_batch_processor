require_relative 'presenter'

module Render
  class IndexGenerator

    def initialize(template_writer, presenter_factory = PresenterFactory.new)
      @template_writer = template_writer
      @presenter_factory = presenter_factory
    end

    def generate(works)
      @template_writer.write(generate_index(works), UrlHelper.index_url)
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
        { url: UrlHelper.camera_make_url(camera_make.name), name: camera_make.name }
      end
    end

  end
end
