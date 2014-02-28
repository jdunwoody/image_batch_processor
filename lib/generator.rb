#encoding: utf-8 ;

require 'pry'
require 'uri'

require './lib/presenters/presenter'

class Generator

  def initialize(output_dir)
    @output_dir = output_dir
  end

  def generate(works)
    generate_models(works)
    generate_camera_makes(works)
    generate_index(works)
  end

  private

  def generate_index(works)
    navigation_items = works.camera_makes.map do |camera_make|
      { url: "camera_make-#{URI.escape(camera_make.name)}.html", name: camera_make.name }
    end

    # shouldn't need this
    thumbnail_urls = works.thumbnails[0..10].map do |thumbnail|
      { url: thumbnail }
    end

    view = Presenter.new
    view.title = 'Index'
    view.navigation_items = navigation_items
    view.thumbnail_urls = thumbnail_urls
    template = view.render

    File.open(File.join(@output_dir, "index.html"), 'w') do |f|
      f.write(template)
    end
  end

  def generate_camera_makes(works)
    works.camera_makes.each do |camera_make|
      generate_camera_make(camera_make)
    end
  end

  def generate_camera_make(camera_make)
    navigation_items = [{ url: "index.html", name: 'index' }]
    navigation_items += camera_make.models.map do |model|
      { url: "model-#{URI.escape(model.name)}.html", name: model.name }
    end

    # shouldn't need this
    thumbnail_urls = camera_make.thumbnails[0..10].map do |thumbnail|
      { url: thumbnail }
    end

    view = Presenter.new
    view.title = camera_make.name
    view.navigation_items = navigation_items
    view.thumbnail_urls = thumbnail_urls
    template = view.render

    File.open(File.join(@output_dir, "camera_make-#{URI.escape(camera_make.name)}.html"), 'w') do |f|
      f.write(template)
    end
  end

  def generate_models(works)
    works.models.each do |model|
      generate_model(model)
    end
  end

  def generate_model(model)
    navigation_items = [
      { url: "index.html", name: 'index' },
      { url: "camera_make-#{URI.escape(model.camera_make.name)}.html", name: model.camera_make.name },
    ]

    # shouldn't need this
    thumbnail_urls = model.thumbnails[0..10].map do |thumbnail|
      { url: thumbnail }
    end

    view = Presenter.new
    view.title = model.name
    view.navigation_items = navigation_items
    view.thumbnail_urls = thumbnail_urls
    template = view.render

    File.open(File.join(@output_dir, "model-#{URI.escape(model.name)}.html"), 'w') do |f|
      f.write(template)
    end
  end

end
