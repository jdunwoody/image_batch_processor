
This program parses an XML file containing image metadata. It extracts a thumbnail, Camera Make and Camera Model for each entry in the XML file.

Tested against ruby
2.0.0-p195

Installation
============

	Clone this repo
	bundle install

Usage
=====

	bundle exec ./image_batch_processor.rb input_xml_file output_directory

input_xml_file must be an XML file that contains camera make, model a small thumbnail in the following format:

	<?xml version="1.0"?>
	<works>
	  <work>
	    <urls>
	      <url type="small"> PATH TO URL</url>
	    </urls>
	    <exif>
	      <model> MODEL </model>
	      <make> MAKE</make>
	    </exif>
	  </work>
	</works>

The output directory is created if it doesn't exist.

An index.html file is created in the root of output_dir:

	open output_directory/index.html
