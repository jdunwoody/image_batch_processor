require './lib/presenters/presenter'

module PageGenerators
  class PresenterFactory

    def make_presenter(title, navigation_items, thumbnail_urls)
      view = Presenters::Presenter.new

      view.title = title
      view.navigation_items = navigation_items
      view.thumbnail_urls = thumbnail_urls

      view
    end

  end
end
