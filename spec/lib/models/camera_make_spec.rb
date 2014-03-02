
require './lib/models/camera_make'

module Models
  describe CameraMake do
    describe '#add_model' do
      let(:camera_make) { CameraMake.new('Camera Name') }

      it 'creates a camera model' do
        model = camera_make.add_model('Camera Make', 'thumbnail')

        expect(camera_make.models.size).to eq(1)
      end

      it 'returns the created camera model' do
        model = camera_make.add_model('Camera Make', 'thumbnail')

        expect(camera_make.models).to eq([model])
      end

      it 'populates thumbnails for this model' do
        model = camera_make.add_model('Camera Make', 'thumbnail')

        expect(model.thumbnails.urls.size).to eq(1)
      end

    end

    describe '#name_matches?' do

      it 'names match case insensitively, ignoring extra whitespace' do
        camera_make = CameraMake.new('Camera Name')

        expect(camera_make.name_matches?('  CaMeRa NaMe  ')).to be_true
      end

    end
  end
end
