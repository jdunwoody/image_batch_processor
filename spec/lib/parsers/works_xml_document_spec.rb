
require './lib/parsers/works_xml_document'

module Parsers
  describe WorksXMLDocument do

    let(:xml_document) { WorksXMLDocument.new }
    let(:parser) { Nokogiri::XML::SAX::Parser.new(xml_document) }

    it 'does not create a work when all fields are missing' do
      parser.parse_memory(
        <<-eos
<?xml version="1.0"?>
<works>
  <work> </work>
  <work> </work>
  <work> </work>
</works>
        eos
      )
      expect(xml_document.works.camera_makes).to be_empty
    end

    it 'parses //works/work/urls/url small image url as work.thumbnail' do
      parser.parse_memory(
        <<-eos
<?xml version="1.0"?>
<works>
  <work>
    <urls>
      <url type="small">Thumbnail Image URL</url>
    </urls>
    <exif>
      <make>BLAH</make>
      <model>BLAH</model>
    </exif>
  </work>
</works>
        eos
      )
      expect(xml_document.works.thumbnails.first).to eq('Thumbnail Image URL')
    end

    it 'parses //works/make as work.make' do
      parser.parse_memory(
        <<-eos
<?xml version="1.0"?>
<works>
  <work>
    <urls>
      <url type="small">BLAH</url>
    </urls>
    <exif>
      <make>NIKON CORPORATION</make>
      <model>BLAH</model>
    </exif>
  </work>
</works>
        eos
      )

      expect(xml_document.works.camera_makes.first.name).to eq('NIKON CORPORATION')
    end

    it 'parses //works/model as work.model' do
      parser.parse_memory(
        <<-eos
<?xml version="1.0"?>
<works>
  <work>
    <urls>
      <url type="small">BLAH</url>
    </urls>
    <exif>
      <make>BLAH</make>
      <model>NIKON D80</model>
    </exif>
  </work>
</works>
        eos
      )

      expect(xml_document.works.models.first.name).to eq('NIKON D80')
    end

    it 'parses content that spans multiple lines' do
      parser.parse_memory(
        <<-eos
<?xml version="1.0"?>
<works>
  <work>
    <urls>
      <url type="small">
Thumbnail Image URL
</url>
    </urls>
    <exif>
      <model>
NIKON D80
</model>
      <make>
NIKON CORPORATION
</make>
    </exif>
  </work>
</works>
        eos
      )

      expect(xml_document.works.thumbnails.first).to eq('Thumbnail Image URL')
      expect(xml_document.works.camera_makes.first.name).to eq('NIKON CORPORATION')
      expect(xml_document.works.models.first.name).to eq('NIKON D80')
    end

    it 'ignores content from other tags' do
      parser.parse_memory(
        <<-eos
<?xml version="1.0"?>
<works>
  <work>
    <id>31820</id>
    <urls>
      <url type="small"> Thumbnail Image URL </url>
      <url type="medium"> Medium Image URL </url>
      <url type="large"> Large Image URL </url>
    </urls>
    <exif>
      <flash>0</flash>
      <model> NIKON D80 </model>
      <software>Adobe Photoshop CS3 Macintosh</software>
      <make> NIKON CORPORATION </make>
      <resolution_unit>2</resolution_unit>
    </exif>
  </work>
</works>
        eos
      )

      expect(xml_document.works.thumbnails.first).to eq('Thumbnail Image URL')
      expect(xml_document.works.camera_makes.first.name).to eq('NIKON CORPORATION')
      expect(xml_document.works.models.first.name).to eq('NIKON D80')
    end
  end
end
