require './lib/works_xml_document'

describe WorksXMLDocument do

  let(:xml_document) { WorksXMLDocument.new }
  let(:parser) { Nokogiri::XML::SAX::Parser.new(xml_document) }

  it 'creates a Work object for each //works/work in an XML document' do
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
    xml_document.works.size.should == 3

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
  </work>
</works>
      eos
    )
    xml_document.works.first.thumbnail.should == 'Thumbnail Image URL'
  end

  it 'parses //works/make as work.make' do
    parser.parse_memory(
      <<-eos
<?xml version="1.0"?>
<works>
  <work>
    <make>NIKON CORPORATION</make>
  </work>
</works>
      eos
    )

    xml_document.works.first.make.should == 'NIKON CORPORATION'
  end

  it 'parses //works/model as work.model' do
    parser.parse_memory(
      <<-eos
<?xml version="1.0"?>
<works>
  <work>
    <exif>
      <model>NIKON D80</model>
    </exif>
  </work>
</works>
      eos
    )

    xml_document.works.first.model.should == 'NIKON D80'
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

    xml_document.works.first.thumbnail.should == 'Thumbnail Image URL'
    xml_document.works.first.make.should == 'NIKON CORPORATION'
    xml_document.works.first.model.should == 'NIKON D80'
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

    xml_document.works.first.thumbnail.should == 'Thumbnail Image URL'
    xml_document.works.first.make.should == 'NIKON CORPORATION'
    xml_document.works.first.model.should == 'NIKON D80'
  end
end
