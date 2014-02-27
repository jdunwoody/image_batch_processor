#encoding: utf-8

# relish documentation

class Works
  include ROXML

  xml_name 'Works'

  xml_reader :works, as: [Work]
end
