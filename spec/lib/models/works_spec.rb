require './lib/models/works'

module Models
  describe Works do

    let(:works) { Works.new }

    describe "#add" do
      it 'creates a new CameraMake and adds it to the collection of camera_makes' do
        works.add('camera_make', 'model_name', 'thumbnail')

        expect(works.camera_makes.size).to eq(1)
        expect(works.camera_makes.first.name).to eq('camera_make')
      end

      context 'when a camera_make already exists' do
        before do
          works.add('camera_make', '', '')
          expect(works.camera_makes.size).to eq(1)
        end

        it 'finds the camera_make that matches and doesnt add it to list of camera_makes' do
          works.add('camera_make', '', '')

          expect(works.camera_makes.size).to eq(1)
          expect(works.camera_makes.first.name).to eq('camera_make')
        end
      end

      it 'adds a thumbnail' do
        expect(works.thumbnails.urls).to be_empty
        works.thumbnails.add('thumb')

        expect(works.thumbnails.urls.first).to eq('thumb')
      end

    end
  end
end
