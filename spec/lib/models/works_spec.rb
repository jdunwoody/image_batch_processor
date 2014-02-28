#encoding: utf-8

require './lib/models/works'

describe Works do

  let(:works) { Works.new }

  describe "#find_or_create_make" do

    it 'creates a new Make and adds it to list of makes' do
      works.find_or_create_make('camera_make')

      works.makes.size.should == 1
      works.makes.first.name.should == 'camera_make'
    end

    context 'when a make already exists' do
      it 'finds the make that matches and doesnt add it to list of makes' do
        works.find_or_create_make('camera_make')

        works.makes.size.should == 1

        works.find_or_create_make('camera_make')

        works.makes.size.should == 1
        works.makes.first.name.should == 'camera_make'
      end
    end
  end

  # remove monkey patched should usage. use new rspec
  describe '#add_thumbnail' do

    it 'adds a thumbnail' do
      works.thumbnails.should be_empty
      works.add_thumbnail('thumb')

      works.thumbnails.should == ['thumb']
    end

  end
end
