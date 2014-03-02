require './lib/presenters/presenter_factory'


module PageGenerators
  describe PresenterFactory do
    describe '#make_presenter' do

      it 'creates a presenter with a title' do
        presenter_factory = PresenterFactory.new

        view = presenter_factory.make_presenter('Title', [], [])

        expect(view.title).to eq('Title')
      end

    end
  end
end
