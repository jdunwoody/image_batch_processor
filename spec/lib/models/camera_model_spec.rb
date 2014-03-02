
require './lib/models/camera_model'

module Models
  describe CameraModel do
    describe '#name_matches?' do

      it 'names match case insensitively, ignoring extra whitespace' do
        camera_make = double(CameraMake)

        camera_model = CameraModel.new('Camera Model', camera_make)

        expect(camera_model.name_matches?('  CaMeRa MoDeL  ')).to be_true
      end

    end
  end
end
