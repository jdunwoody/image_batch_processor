#! /usr/bin/ruby

require 'mustache'

class DataFileGenerator

  MAKE_TO_MODEL =
    {
    'Canon'=>            [ 'EOS REBEL T3i', 'EOS 5D Mark II', 'EOS 7D'],
    'Apple'=>            [ 'iPhone 5', 'iPhone 5s', 'iPhone 4S'],
    'Nikon'=>            [ 'D7000', 'D3100', 'D90'],
    'Sony'=>             [ 'DSC-RX100', 'SLT-A77V', 'Alpha a7'],
    'Samsung'=>          [ 'Galaxy S III', 'Galaxy S4', 'Galaxy S II'],
    'Panasonic'=>        [ 'DMC-FZ200', 'DMC-GF1', 'DMC-FZ35'],
    'Olympus'=>          [ 'E-M5', 'E-M1', 'E-PL1'],
    'Fujifilm'=>         [ 'X100S, X-E1, FinePix X100'],
    'HTC'=>              [ 'One', 'One X+', 'One S'],
    'Pentax'=>           [ 'K-5', 'K-30', 'K-x'],
    'Nokia'=>            [ 'Lumia 1020', 'Lumia 920', 'Lumia 520'],
    'Kodak'=>            [ 'EasyShare C813 Zoom', 'EasyShare Z740 Zoom', 'EasyShare C613 Zoom'],
    'Casio'=>            [ 'EX-Z75', 'EX-S600', 'EX-Z40'],
    'Leica'=>            [ 'M9', 'M8', 'D-LUX 5'],
    'Sony Ericsson'=>    [ 'K800i', 'K750i', 'W810i'],
    'BlackBerry'=>       [ 'Curve 8520', 'Bold 9700', 'Torch 9800'],
    'Konica Minolta'=>   [ 'Maxxum 7D', 'Maxxum 5D', 'DiMAGE Xt'],
    'Motorola'=>         [ 'DROID RAZR', 'DROID X', 'DROID BIONIC'],
    'HP'=>               [ 'PhotoSmart 735', 'PhotoSmart C945', 'PhotoSmart C850'],
    'Ricoh'=>            [ 'GR Digital 3', 'GR Digital 4', 'GR Digital 2'],
    'GoPro'=>            [ 'Hero3-Black Edition', 'HERO3+ Black Edition', 'Hero3-Silver Edition'],
    'Sigma'=>            [ 'DP2 Merrill', 'SD1 Merrill', 'DP1S'],
    'Phase One'=>        [ 'P25', 'P45+', 'H25'],
    'Sanyo'=>            [ 'Xacti VPC C1', 'Xacti E6', 'Xacti VPC CG6'],
    'Vivitar'=>          [ 'ViviCam 3705', 'ViviCam 3785', 'ViviCam 3750'],
    'LG'=>               [ 'VX-9700', 'KU990', 'CU720'],
    'Nintendo'=>         [ '3DS','Point and Shoot'],
    'Epson'=>            [ 'R-D1', 'R-D1s', 'PhotoPC 3000Z'],
    'Polaroid'=>         [ 'i834', 'i733', 'i532'],
    'Sharp'=>            [ 'WX-T91', '910SH', 'SX833'],
    'Kyocera'=>          [ 'Finecam SL400R', 'Contax TVS Digital', 'Finecam SL300R T*'],
    'Acer'=>             [ 'CE-5330', 'CR-8530', 'CI-6330'],
    'Palm'=>             [ 'Pre, Centro', 'Treo 700p'],
    'Toshiba'=>          [ 'PDR-M81', 'PDR-M700', 'PDR-M60'],
    'Google	Glass'=> [ 'Cameraphone'],
    'KDDI'=>             [ 'W53CA', 'W31S', 'W41CA'],
    'BenQ'=>             [ 'DC C640', 'DC 1500', 'DC E610'],
    'DoCoMo'=>           [ 'N905i', 'SO505iS', 'F904i'],
    'JVC'=>              [ 'GZ-MC500', 'GZ-MG20', 'GZ-MG21'],
    'Leaf'=>             [ 'Aptus 22', 'Aptus 75', 'Aptus 65'],
    'Concord'=>          [ 'Eye-Q 3042', 'Eye-Q Go 2000', 'Eye-Q 4060 AF'],
    'Helio'=>            [ 'Ocean', 'Fin', 'Mysto'],
  }


  WORK_TEMPLATE = <<-eos
    <work>
      <id>31820</id>
      <filename>162042.jpg</filename>
      <image_width>2206</image_width>
      <image_height>2205</image_height>
      <urls>
        <url type="small">http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg</url>
        <url type="medium">http://ih1.redbubble.net/work.31820.1.flat,300x300,075,f.jpg</url>
        <url type="large">http://ih1.redbubble.net/work.31820.1.flat,550x550,075,f.jpg</url>
      </urls>
      <exif>
        <flash>0</flash>
        <sharpness>2</sharpness>
        <pixel_y_dimension>2205</pixel_y_dimension>
        <date_time_digitized>Mon Jun 04 14:33:59 +1000 2007</date_time_digitized>
        <exposure_bias_value>0</exposure_bias_value>
        <focal_length_in_35mm_film>93</focal_length_in_35mm_film>
        <subsec_time_orginal>00</subsec_time_orginal>
        <model>{{MODEL}}</model>
        <software>Adobe Photoshop CS3 Macintosh</software>
        <focal_length>62</focal_length>
        <max_aperture_value>47/10</max_aperture_value>
        <scene_capture_type>0</scene_capture_type>
        <subsec_time_digitized>00</subsec_time_digitized>
        <iso_speed_ratings>100</iso_speed_ratings>
        <date_time>Sun Aug 26 12:55:02 +1000 2007</date_time>
        <compressed_bits_per_pixel>4</compressed_bits_per_pixel>
        <subject_distance_range>0</subject_distance_range>
        <custom_rendered>0</custom_rendered>
        <make>{{MAKE}}</make>
        <gain_control>0</gain_control>
        <orientation>1</orientation>
        <exposure_time>1/10</exposure_time>
        <exposure_mode>0</exposure_mode>
        <x_resolution>300</x_resolution>
        <metering_mode>5</metering_mode>
        <sensing_method>2</sensing_method>
        <contrast>0</contrast>
        <color_space>1</color_space>
        <f_number>5</f_number>
        <white_balance>0</white_balance>
        <user_comment/>
        <y_resolution>300</y_resolution>
        <resolution_unit>2</resolution_unit>
        <light_source>0</light_source>
        <saturation>2</saturation>
        <pixel_x_dimension>2206</pixel_x_dimension>
        <date_time_original>Mon Jun 04 14:33:59 +1000 2007</date_time_original>
        <ycb_cr_positioning>2</ycb_cr_positioning>
        <exposure_program>4</exposure_program>
        <digital_zoom_ratio>1</digital_zoom_ratio>
        <subsec_time>00</subsec_time>
        <jpeg_interchange_format>978</jpeg_interchange_format>
        <jpeg_interchange_format_length>7171</jpeg_interchange_format_length>
        <x_resolution>72</x_resolution>
        <compression>6</compression>
        <y_resolution>72</y_resolution>
        <resolution_unit>2</resolution_unit>
      </exif>
    </work>
  eos

  def generate_large_file
    contents =     <<-eos
<?xml version="1.0"?>
<works>
    eos
    100.times do |n|
      MAKE_TO_MODEL.each do |make, models|
        models.each do |model|
          contents << Mustache.render(WORK_TEMPLATE, MAKE: make, MODEL: "#{model}_#{n}")
        end
      end
    end
    contents << '</works>'

    file_name = 'very-large.xml'
    File.write(file_name, contents)

    file_name
  end

end


input_file = DataFileGenerator.new.generate_large_file

puts "Generated #{input_file}"
