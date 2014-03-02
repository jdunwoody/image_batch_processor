require './lib/presenters/presenter'

module PageGenerators
  class PresenterFactory
    def make_presenter(title, navigation_items, thumbnail_urls)
      view = Presenters::Presenter.new

      view.title = model.name
      view.navigation_items = generate_navigation_items(model)
      view.thumbnail_urls = generate_thumbnail_urls(model)

      view
    end
  end
end
