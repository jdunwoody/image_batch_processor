require './lib/models/thumbnails'

module Models
  describe Thumbnails do

    let(:thumbnails) { Thumbnails.new }

    describe "#add" do
      it 'adds the thumbnail to its collection' do
        thumbnails.add('thumbnail')

        expect(thumbnails.urls.size).to eq(1)
        expect(thumbnails.urls.first).to eq('thumbnail')
      end

      context 'when a thumbnail already exists' do
        before do
          thumbnails.add('thumbnail')
        end

        it 'finds the camera_make that matches and doesnt add it to list of camera_makes' do
          thumbnails.add('thumbnail')

          expect(thumbnails.urls.size).to eq(1)
          expect(thumbnails.urls.first).to eq('thumbnail')
        end

      end
    end
  end
end
