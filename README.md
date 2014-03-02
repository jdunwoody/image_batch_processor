
This program parses an XML file containing image metadata. It extracts a thumbnail, Camera Make and Camera Model for each entry in the XML file.

Tested against ruby
2.0.0-p195

Installation
============

	bundle install

Usage
=====

	bundle exec ./batch_processor <Input XML File> <Output Directory>

<Input XML File> must be an XML file that contains camera make, model a small thumbnail in the format specified.

The output directory is created if it doesn't exist.

	open <Output Directory>/index.html
