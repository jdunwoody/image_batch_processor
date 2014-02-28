#encoding: utf-8

require './lib/models/works'

module Models
  describe Works do

    let(:works) { Works.new }

    describe "#find_or_create_make" do

      it 'creates a new Make and adds it to list of makes' do
        works.find_or_create_make('camera_make')

        expect(works.makes.size).to eq(1)
        expect(works.makes.first.name).to eq('camera_make')
      end

      context 'when a make already exists' do
        it 'finds the make that matches and doesnt add it to list of makes' do
          works.find_or_create_make('camera_make')

          expect(works.makes.size).to eq(1)

          works.find_or_create_make('camera_make')

          expect(works.makes.size).to eq(1)
          expect(works.makes.first.name).to eq('camera_make')
        end
      end
    end

    describe '#add_thumbnail' do

      it 'adds a thumbnail' do
        expect(works.thumbnails).to be_empty
        works.add_thumbnail('thumb')

        expect(works.thumbnails).to eq(['thumb'])
      end

    end
  end
end
