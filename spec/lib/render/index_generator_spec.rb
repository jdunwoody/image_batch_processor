require './lib/render/index_generator'
require './lib/render/template_writer'
require './lib/render/presenter_factory'
require './lib/models/works'

module Render
  describe IndexGenerator do
    describe '#generate' do

      let(:template_writer) { double(TemplateWriter, write: 'page data') }
      let(:presenter) { Presenter.new }
      let(:presenter_factory) { double(PresenterFactory, make_presenter: presenter ) }

      before do
        presenter.stub(render: 'page data')
      end

      it 'creates a presenter with a title, navigation and thumbnails' do
        works = Models::Works.new
        works.add('Camera Make','Camera Model','Thumb')

        index_generator = IndexGenerator.new(template_writer, presenter_factory)

        title = 'Index'
        navigation_items = [
          { url: 'camera-make-Camera-Make.html', name: 'Camera Make' }
        ]
        thumbnails = [ url: 'Thumb' ]

        expect(presenter_factory).to receive(:make_presenter).with(title, navigation_items, thumbnails)

        index_generator.generate(works)
      end

    end
  end
end
