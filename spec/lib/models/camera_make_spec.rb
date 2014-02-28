
require './lib/models/camera_make'

module Models
  describe CameraMake do
    describe '#add_model' do

      it 'creates a camera model' do
        camera_make = CameraMake.new('Camera Name')
        model = camera_make.add_model('Camera Make', 'thumbnail')

        expect(camera_make.models.size).to eq(1)
      end

      it 'returns the created camera model' do
        camera_make = CameraMake.new('Camera Name')
        model = camera_make.add_model('Camera Make', 'thumbnail')

        expect(camera_make.models).to eq([model])
      end

    end
  end
end
