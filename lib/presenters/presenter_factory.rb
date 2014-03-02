require './lib/presenters/presenter'

module PageGenerators
  class PresenterFactory
    def make_presenter
      view = Presenters::Presenter.new
    end
  end
end
