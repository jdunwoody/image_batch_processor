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
    generate_makes(works)
    generate_index(works)
  end

  private

  def generate_index(works)
    navigation_items = works.makes.map do |make|
      { url: "make-#{URI.escape(make.name)}.html", name: make.name }
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

  def generate_makes(works)
    works.makes.each do |make|
      generate_make(make)
    end
  end

  def generate_make(make)
    navigation_items = [{ url: "index.html", name: 'index' }]
    navigation_items += make.models.map do |model|
      { url: "model-#{URI.escape(model.name)}.html", name: model.name }
    end

    # shouldn't need this
    thumbnail_urls = make.thumbnails[0..10].map do |thumbnail|
      { url: thumbnail }
    end

    view = Presenter.new
    view.title = make.name
    view.navigation_items = navigation_items
    view.thumbnail_urls = thumbnail_urls
    template = view.render

    File.open(File.join(@output_dir, "make-#{URI.escape(make.name)}.html"), 'w') do |f|
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
      { url: "make-#{URI.escape(model.make.name)}.html", name: model.make.name },
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
