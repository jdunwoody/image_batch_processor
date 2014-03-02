require './lib/models/works'

require './lib/render/camera_model_generator'
require './lib/render/template_writer'
require './lib/render/presenter_factory'

module Render
  describe CameraModelGenerator do
    describe '#generate' do

      let(:template_writer) { double(TemplateWriter, write: 'page data') }
      let(:presenter) { Render::Presenter.new }
      let(:presenter_factory) { double(PresenterFactory, make_presenter: presenter ) }

      before do
        presenter.stub(render: 'page data')
      end

      it 'creates a presenter with a title, navigation and thumbnails' do
        works = Models::Works.new
        works.add('Camera Make','Camera Model','Thumb')

        camera_model_generator = CameraModelGenerator.new(template_writer, presenter_factory)

        title = 'Camera Model'
        navigation_items = [
          { url: 'index.html', name: 'index' },
          { url: 'camera_make-Camera%20Make.html', name: 'Camera Make' }
        ]
        thumbnails = [ url: 'Thumb' ]

        expect(presenter_factory).to receive(:make_presenter).with(title, navigation_items, thumbnails)

        camera_model_generator.generate(works)
      end

    end
  end
end
