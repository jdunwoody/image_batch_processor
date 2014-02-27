#encoding: utf-8

# relish documentation

class Work
  include ROXML

  xml_name 'Work'

  xml_reader(:thumbnail, from: 'urls/url[small]')
  xml_reader(:make, from: 'exif/make')
  xml_reader(:model, from: 'exif/model')

end
